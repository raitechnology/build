#!/bin/bash

base=$(basename $PWD)
copr-cli list-packages --with-latest-build $base > pkgs.json
name=($(jq -r '.[].name' < pkgs.json))
ver=($(jq -r '.[].latest_build.source_package.version' < pkgs.json))
build=($(jq -r '.[].latest_build.id' < pkgs.json))

echo found packages: ${name[@]}
echo found versions: ${ver[@]}
echo found builds:   ${build[@]}

count=${#name[@]}
need=()
/bin/rm -r -f fedora-rawhide-x86_64

for (( i=0; i<${count}; i++ ));
do
  chroots=($(jq -r ".[$i].latest_build.chroots[]" < pkgs.json))
  ndist=${#chroots[@]}
  ver2=$(sed 's/.fc[0-9][0-9]//' <<< ${ver[$i]})
  for (( j=0; j<${ndist}; j++ ));
  do
    c=${chroots[$j]}
    # rawhide is deleted at the top of this script, so don't let its absence trigger downloads
    [ "$c" = "fedora-rawhide-x86_64" ] && continue
    f=${c}/${name[$i]}-${ver2}
    if ! compgen -G "${f}.*.x86_64.rpm" > /dev/null ; then
      need+=(${build[$i]})
      break
    fi
  done
done

count=${#need[@]}
echo download builds: ${need[@]}

# copr-cli download-build shells out to wget (wget2 on fc43+) with --no-verbose,
# which prints NOTHING on a failed file, and copr-cli ignores wget's exit code.
# So a dropped rpm is invisible.  After each download, list the build's result
# dir on the copr backend and fetch anything missing with curl --retry; fail
# loudly if a file still can't be had.
# rpm 6 (fc43+) no longer knows SHA1/MD5, so on el7 packages every digest is
# NOTFOUND and plain `rpm -K` says DIGESTS NOT OK for a perfectly good file.
# Accept: any digest OK and none BAD.  Legacy (nothing found at all): fall back
# to header readable + size == server Content-Length.
rpm_ok()
{
  local f=$1 url=$2 out len
  out=$(rpm -Kv --nosignature "$f" 2>/dev/null)
  grep -q "BAD" <<< "$out" && return 1
  grep -q "digest: OK" <<< "$out" && return 0
  rpm -qp --qf '%{NAME}' "$f" > /dev/null 2>&1 || return 1
  len=$(curl -sI --retry 3 "$url" | tr -d '\r' | awk 'tolower($1)=="content-length:" {print $2}')
  [ -n "$len" ] && [ "$len" = "$(stat -c %s "$f")" ]
}

fetch_missing()
{
  local id=$1 rc=0 c url f files
  local base_url=https://download.copr.fedorainfracloud.org/results/injinj/$base
  local pkg=$(jq -r --argjson id $id '.[] | select(.latest_build.id == $id) | .name' < pkgs.json)
  for c in $(jq -r --argjson id $id '.[] | select(.latest_build.id == $id) | .latest_build.chroots[]' < pkgs.json) ; do
    [ "$c" = "fedora-rawhide-x86_64" ] && continue
    mkdir -p "$c"
    url=$base_url/$c/$id-$pkg/
    # copr's directory listing uses single-quoted hrefs; accept either quote style
    listing=$(curl -sf --retry 3 "$url") || { echo "ERROR: cannot fetch listing $url" >&2 ; rc=1 ; continue ; }
    files=$(grep -oE "href=[\"'][^\"']*\.rpm[\"']" <<< "$listing" | sed "s/^href=[\"']//;s/[\"']\$//" | sort -u)
    if [ -z "$files" ] ; then
      # copr's prunerepo has emptied this build dir (only logs/'success' left):
      # the rpms no longer exist anywhere on copr, a rebuild is the only fix.
      # not fatal: what is already here is still good, sign it.
      if grep -q "href=[\"']success[\"']" <<< "$listing" ; then
        echo "WARN: $pkg build $id results pruned on copr ($c): rebuild it, e.g. copr-cli build-package --name $pkg injinj/$base" >&2
      else
        echo "ERROR: no rpms listed at $url (format changed?)" >&2 ; rc=1
      fi
      continue
    fi
    for f in $files ; do
      if [ ! -s "$c/$f" ] ; then
        echo "missing $c/$f, fetching"
        if ! curl -sf --retry 5 --retry-all-errors -o "$c/$f" "$url$f" ; then
          echo "ERROR: could not download $url$f" >&2 ; rm -f "$c/$f" ; rc=1 ; continue
        fi
      fi
      # catch truncated files: header+payload digest check, no signature needed;
      # re-fetch once before giving up
      if ! rpm_ok "$c/$f" "$url$f" ; then
        echo "$c/$f fails digest check (truncated?), re-fetching"
        rm -f "$c/$f"
        curl -sf --retry 5 --retry-all-errors -o "$c/$f" "$url$f"
        if ! rpm_ok "$c/$f" "$url$f" ; then
          echo "ERROR: $c/$f still bad after re-fetch, removing" >&2 ; rm -f "$c/$f" ; rc=1
        fi
      fi
    done
  done
  return $rc
}

failed=0
for (( i=0; i<${count}; i++ ));
do
  copr-cli download-build ${need[$i]}
  rm -f *-x86_64/*.gz *-x86_64/*.log *-x86_64/*.spec *-x86_64/chroot_scan
  rm -f *-x86_64/success *-x86_64/*.html *-x86_64/*.info *-x86_64/*.json
  rm -r -f *-x86_64/var
  fetch_missing ${need[$i]} || failed=1
done
if [ $failed = 1 ] ; then
  echo "ERROR: incomplete download, not signing" >&2
  rm -f pkgs.json
  exit 1
fi

ssh -t epel-8 "find injinj/$base/*-x86_64 -name '*.rpm' -exec rpm --addsign {} \;"

rm -f pkgs.json

#for i in *-x86_64 ;
#do
#cat > raitechnology_${i}.repo <<xxx
#[raitechnology]
#name=Rai Technology ${i}
#baseurl=https://www.raitechnology.com/repo/${i}
#enabled=1
#gpgcheck=1
#gpgkey=https://www.raitechnology.com/repo/RPM-GPG-KEY-raitechnology
#xxx
#done

#for i in *-x86_64 ;
#do
#  /bin/rm -r -f $i/repodata
#  createrepo $i
#  rsync -av raitechnology_${i}.repo pumpkin:/home/raitechnology.com/repo/
#  rsync -av $i pumpkin:/home/raitechnology.com/repo/
#  rm -f raitechnology_${i}.repo
#done
