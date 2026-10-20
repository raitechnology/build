# rel/ and dev/ — publishing COPR builds to the rpm repos

Everything is run from chex as chris; nothing runs on the web hosts.
`rel/` publishes the **injinj/rel** COPR project (release builds of the
`raitechnology/*` repos) to https://www.raitechnology.com/repo/; `dev/` is
the same scripts for **injinj/dev** (the `injinj/*` `dev` branches) going
to https://www.raitechnology.com/dev/. The scripts take the COPR project
name from the directory they run in (`basename $PWD`), which is why
`dev/down.sh` is a copy and `dev/up.sh` a symlink.

Only the scripts and the `.repo` templates are tracked. The
`<chroot>-x86_64/` directories (the downloaded, signed rpms — ~18 GB in
rel, ~6 GB in dev) and the `pkgs.json` work file are ignored; they are
re-creatable from COPR, except where COPR has already pruned a build (see
below), which is the reason the local copies are kept.

## Flow

```
copr-cli (webhook build)  →  ./down.sh  →  sign on epel-8  →  ./up.sh  →  www + pumpkin
```

1. **Build on COPR.** A push to `raitechnology/<pkg>` `main` triggers the
   rel build (dev: push to `injinj/<pkg>` `dev`). Confirm it finished:
   `copr-cli list-packages --with-latest-build rel | jq '.[] | {name, state: .latest_build.state}'`.
   Chroots: epel-7/8/9/10, fedora-43/44/45/rawhide, x86_64.
2. **`./down.sh`** (~15 min for a full fleet). Lists the latest build of
   every package, downloads the builds whose rpms are not already present
   in `<chroot>-x86_64/`, strips the COPR logs/metadata, re-fetches
   anything `copr-cli download-build` silently dropped (it shells out to
   wget with `--no-verbose` and ignores its exit code), then signs every
   rpm by `ssh -t epel-8 'rpm --addsign …'`. Exits 1 without signing if a
   download is incomplete. `fedora-rawhide-x86_64` is deleted and
   re-downloaded every run.
3. **`./up.sh`** (~10 min). For each chroot dir: `createrepo`
   (`createrepo_c --compatibility` for epel-7), write the per-chroot
   `raitechnology_<chroot>.repo` (one for www, one for pumpkin — the
   baseurl differs), rsync the `.repo` file and the directory to both
   hosts. **It does not `--delete`**; never rsync the top directory with
   `--delete` by hand either — `index.html`, the GPG key and the generic
   `raitechnology_{epel,fedora}-x86_64.repo` files live beside the chroot
   dirs on the server.
4. **Verify** without touching dnf config:
   `dnf -q --disablerepo='*' --repofrompath=rt,https://www.raitechnology.com/repo/fedora-43-x86_64 --setopt=rt.gpgcheck=0 repoquery --latest-limit 1 <pkg>`
   and `curl -sI https://www.raitechnology.com/repo/fedora-43-x86_64/repodata/repomd.xml`.
   A signed rpm shows `rpm -qp --qf '%{SIGPGP:pgpsig}' f.rpm` →
   `RSA/SHA256 … Key ID 532df184`.
5. **Page.** `www:/home/raitechnology.com/repo/index.html` (copy on
   pumpkin) is hand-maintained: a per-package table (new package → new
   row: description, GitHub link, license) and the install table of
   current chroots. Back up as `index.html.bak-<date>` before editing.

`./prune.py [-n KEEP] [-d]` keeps the newest KEEP (default 3) releases per
package per chroot locally, treating bin + src + debuginfo + debugsource
as one group; `-d` is a dry run. Run it before `up.sh` when the dirs
grow, then let the next `up.sh` (no `--delete`) leave the old rpms on the
server or clean them there by hand.

Both scripts outlive a typical shell timeout; from an agent run them as
`systemd-run --user --unit=rel-down --collect …` with output to a log.

## Hosts and keys the scripts assume

- **`epel-8`** — ssh alias for an nspawn container on chex that shares
  `/home/chris` (so `injinj/rel/*-x86_64` is the same directory). It has
  rpm 4.14, so signatures stay readable by EL7/EL8 `rpm`, and the
  signing key `RPM-GPG-KEY-raitechnology` (Key ID `532DF1847110B2D1`) in
  its `~/.gnupg` without a passphrase. Its login shell is `es`, so any
  compound remote command must be `ssh epel-8 bash -c '…'`. The public
  half is `../doc/RPM-GPG-KEY-raitechnology` and is served from both repo
  roots.
- **`www`** — ssh alias for the Contabo host serving www.raitechnology.com
  (sshd on port 22009); docroot `/home/raitechnology.com/`.
- **`pumpkin`** — the home router/standby; receives an identical copy
  under `/home/raitechnology.com/` and pulls www's LE cert nightly. If
  www is down, point the A/AAAA records at pumpkin and the repo keeps
  serving (its `.repo` files already carry the pumpkin baseurl).
- Nothing secret is in this directory: the key, the ssh host details and
  the COPR API token live in the container's `~/.gnupg`, `~/.ssh/config`
  and `~/.config/copr` respectively.

## Known traps

- `WARN: … results pruned on copr` from `down.sh` is a **false alarm when
  the rpm is already in the chroot dir**: COPR keeps rpms only in its
  repo after prunerepo, so the per-build listing shows logs only. Check
  `ls <chroot>/<pkg>-<ver>*.x86_64.rpm` first; only rebuild
  (`copr-cli build-package --name <pkg> injinj/rel`) if the file is absent.
- The fedora-37..42 directories are history; the install table on the
  page lists only epel-7..10 and fedora-43+ as current. `up.sh` still
  publishes every `fedora*-x86_64` dir present.
- A package new to rel needs a row on the page and, if it is a library
  other packages `BuildRequires`, its `<pkg>_dep` pin in the dependents'
  `build_depends.mak` before their next COPR build.

## Related

- `../nuget/up.sh` — the same build-locally / publish-to-www shape for the
  RaiApi2 .NET package (sleet static feed → https://www.raitechnology.com/nuget/).
- Windows installers (raims, raimdapi) go to
  https://www.raitechnology.com/raimdapi/ by hand; see each repo's
  `win/README-windows.md`.
