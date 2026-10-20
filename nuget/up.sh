#!/bin/bash
# NuGet static feed (sleet) for the .NET bindings -> https://www.raitechnology.com/nuget/
#
#   ./up.sh                 push every ../*/FC*-mingw/dist/*.nupkg not yet in the feed, rsync to www
#   ./up.sh file.nupkg ...  push the given packages, rsync to www
#
# Same shape as ../rel/up.sh for rpms: build locally, (sign), publish to www.
# The feed lives in ./feed (sleet.json); the baseURI is baked into the feed's
# index.json, so the directory must be served at exactly that URL.
#
# Consumers:  dotnet nuget add source https://www.raitechnology.com/nuget/index.json -n raitechnology
#             dotnet add package RaiApi2
set -e
cd "$(dirname "$0")"
export repo=www:/home/raitechnology.com/nuget/
# pumpkin is a plain backup copy (the feed's baseURI is www; flip DNS to use it)
export repo2=pumpkin:/home/raitechnology.com/nuget/

[ -d feed ] || sleet init -c sleet.json -s www

if [ $# -gt 0 ] ; then
  pkgs=("$@")
else
  pkgs=( $(ls ../*/FC*-mingw/dist/*.nupkg 2>/dev/null) )
fi
[ ${#pkgs[@]} -gt 0 ] || { echo "no .nupkg found" >&2 ; exit 1 ; }

for p in "${pkgs[@]}" ; do
  # sleet refuses an existing id/version unless --force; a rebuilt package with
  # the same version replaces the old one, like re-signing an rpm.
  sleet push -c sleet.json -s www --force "$p"
done
sleet validate -c sleet.json -s www
rsync -av --delete feed/ ${repo}
rsync -av --delete feed/ ${repo2}
