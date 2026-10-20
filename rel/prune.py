#!/usr/bin/env python3
"""
prune.py - keep only the latest N (epoch, version, release) tuples per
base package per chroot directory, treating binary + src + debuginfo +
debugsource as a single atomic group.

Usage:
    ./prune.py [-n KEEP] [-d]

    -n KEEP   number of newest releases to keep per (base, chroot). Default: 3.
    -d        dry run; print what would be deleted but don't actually delete.
"""
from __future__ import annotations

import argparse
import os
import subprocess
import sys
from collections import defaultdict
from pathlib import Path

REL_DIR = Path(__file__).resolve().parent  # ~/injinj/rel


def rpm_query(path: Path) -> tuple[str, str, str, str] | None:
    """Return (name, epoch, version, release) for an RPM file, or None on error.

    Uses `rpm -qp --qf` so we get whatever rpm itself thinks the metadata is —
    no fragile filename parsing. epoch is "0" if unset.
    """
    try:
        out = subprocess.check_output(
            [
                "rpm",
                "-qp",
                "--nosignature",
                "--qf",
                "%{NAME}|%{EPOCH}|%{VERSION}|%{RELEASE}\n",
                str(path),
            ],
            stderr=subprocess.DEVNULL,
        ).decode().strip()
    except subprocess.CalledProcessError:
        return None
    name, epoch, version, release = out.split("|", 3)
    if epoch in ("(none)", ""):
        epoch = "0"
    return name, epoch, version, release


def base_name(name: str) -> str:
    """Strip -debuginfo / -debugsource so subpackages group with their parent."""
    for suffix in ("-debuginfo", "-debugsource", "-debuginfo-common"):
        if name.endswith(suffix):
            return name[: -len(suffix)]
    return name


def vercmp(a: tuple[str, str, str], b: tuple[str, str, str]) -> int:
    """Compare two (epoch, version, release) tuples using rpm's own logic.

    Returns -1, 0, or 1.
    """
    a_str = f"{a[0]}:{a[1]}-{a[2]}"
    b_str = f"{b[0]}:{b[1]}-{b[2]}"
    try:
        # rpmdev-vercmp exits 11 if a<b, 12 if a>b, 0 if equal
        rc = subprocess.run(
            ["rpmdev-vercmp", a_str, b_str],
            capture_output=True,
        ).returncode
        if rc == 0:
            return 0
        if rc == 11:
            return -1
        if rc == 12:
            return 1
    except FileNotFoundError:
        pass
    # Fallback: lexicographic on tuples (good enough when versions are well-formed)
    return (a > b) - (a < b)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-n", "--keep", type=int, default=3, help="releases to keep per package per chroot")
    ap.add_argument("-d", "--dry-run", action="store_true", help="print but don't delete")
    args = ap.parse_args()

    os.chdir(REL_DIR)

    chroots = sorted(p for p in Path(".").glob("*-x86_64") if p.is_dir())
    if not chroots:
        print(f"No *-x86_64 directories found under {REL_DIR}", file=sys.stderr)
        return 1

    total_deleted = 0
    for chroot in chroots:
        rpms = sorted(chroot.glob("*.rpm"))
        if not rpms:
            continue

        # Group: base_name -> list of (epoch, version, release, [paths])
        groups: dict[str, dict[tuple[str, str, str], list[Path]]] = defaultdict(lambda: defaultdict(list))
        for rpm in rpms:
            meta = rpm_query(rpm)
            if meta is None:
                print(f"WARN: could not query {rpm}", file=sys.stderr)
                continue
            name, epoch, ver, rel = meta
            base = base_name(name)
            groups[base][(epoch, ver, rel)].append(rpm)

        # Per base: sort releases newest-first, keep top N, delete the rest
        chroot_deleted = 0
        for base, releases in sorted(groups.items()):
            # Sort (epoch, ver, rel) tuples newest-first using rpm's own vercmp
            keys = list(releases.keys())
            # Manual selection sort by vercmp — small N, fine
            sorted_keys: list[tuple[str, str, str]] = []
            remaining = keys[:]
            while remaining:
                best = remaining[0]
                for k in remaining[1:]:
                    if vercmp(k, best) > 0:
                        best = k
                sorted_keys.append(best)
                remaining.remove(best)

            keep = sorted_keys[: args.keep]
            drop = sorted_keys[args.keep :]
            if not drop:
                continue
            for tup in drop:
                for path in releases[tup]:
                    if args.dry_run:
                        print(f"PRUNE  {path}")
                    else:
                        print(f"DELETE {path}")
                        path.unlink()
                    chroot_deleted += 1

        if chroot_deleted:
            print(f"=== {chroot}: {chroot_deleted} files {'would be ' if args.dry_run else ''}removed")
        total_deleted += chroot_deleted

    print()
    verb = "would be removed" if args.dry_run else "removed"
    print(f"Total: {total_deleted} files {verb} (keeping {args.keep} newest per package per chroot)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
