
#raimd=58
#raikv=134
#sassrv=87
#raids=102
#natsmd=72
#raims=113
#omm=26
#rvcache=8
#raimdapi=5
#ossl=2

testing=0
checkout=0
minorinc=1
merge_master=0
master=master
rebuild=0

opt=${1:?usage: $0 [-t testing] [-c|-d checkout] [-m merge] [-b rebuild] repo}
case $opt in
  -t)
  testing=1
  shift
  ;;
  -c)
  checkout=1
  shift
  ;;
  -d)
  checkout=1
  minorinc=0
  shift
  ;;
  -m)
  merge_master=1
  shift
  ;;
  -b)
  rebuild=1
  shift
  ;;
esac

name=${1:?usage: $0 [-t testing] [-c checkout] [-m merge] [-b rebuild] repo}
version=$(make -s -C $name spec_build 2> /dev/null | sed 's/[a-z_0-9]* := //')
if [ "${version}x" = "x" ] ; then
  echo "No version number in directory: " $name >&2
  exit 1
fi

case $version in
  *-*) build=${version#*-}; base=${version%%-*} ;;
  *)   build='';            base=$version ;;
esac

major=${base%%.*}
rest=${base#*.}
minor=${rest%%.*}
patch=${rest#*.}

for x in "$major" "$minor" "$patch" "$build" ; do
  case $x in
    ''|*[!0-9]*) echo "Invalid version: $version" >&2; exit 1 ;;
  esac
done

case ${name} in
  openpgm)
  master=rai
  ;;
  libdecnumber)
  ;;
  linecook)
  ;;
  rdbparser)
  ;;
  h3)
  ;;
  lzf)
  ;;
  HdrHistogram_c)
  master=rai
  ;;
  raimd)
  ;;
  raikv)
  ;;
  sassrv)
  ;;
  raids)
  ;;
  natsmd)
  ;;
  raims)
  ;;
  omm)
  master=main
  ;;
  raimdapi)
  ;;
  ossl)
  master=main
  ;;
  rvcache)
  master=main
  ;;
  *)
  echo "arg1: raikv, sassrv, raids, natsmd, raims, raimd, omm, ossl, rvcache"
  exit 1
esac

cd $name
branch=$(git symbolic-ref --quiet --short HEAD || git rev-parse --short HEAD) || exit 1;

if [ "${checkout}" = "1" ] ; then
  if [ "${branch}" != "${master}" ] ; then
    echo "Branch is not master: " $name " != " $master >&2
    exit 1
  fi
  build_num=$(($build + 1))
  minor_num=$minor
  if [ "${minorinc}" = "1" ] ; then
    minor_num=$(($minor + 1))
  fi
  git checkout -b build_${build}
  sed -e "s/^minor_num[ ]*:= [0-9]*/minor_num   := ${minor_num}/" \
      -e "s/^build_num[ ]*:= [0-9]*/build_num   := ${build_num}/" < .copr/Makefile > .copr/Makefile.new
  mv .copr/Makefile .copr/Makefile.bak
  mv .copr/Makefile.new .copr/Makefile
  diff .copr/Makefile .copr/Makefile.bak
  rm .copr/Makefile.bak
  exit 0
fi

if [ "${branch}" != build_${build} ] ; then
  echo "Branch is not build: " $name " != " $branch >&2
  exit 1
fi

#/bin/rm -f *x86_64*/*${1}*
#find src_rpm -name "${1}*" -exec rm -f {} \;
#find rpm_build -name "${1}*" -exec rm -r -f {} \;
# make dirs

if [ "${testing}" = "1" ] ; then
  echo version = ${version}
  echo major = ${major}
  echo minor = ${minor}
  echo patch = ${patch}
  echo build = ${build}
  echo master = ${master}
  echo testing = ${testing}
  echo branch = ${branch}
  exit 0
fi

if [ "${rebuild}" = "1" ] ; then
  rm -f CMakeLists.txt
  rm -r -f FC*_x86_64*
  rm -r -f FC*_aarch64*
  rm -r -f DEB*_x86_64*
  rm -r -f DEB*_aarch64*
  make
  exit 0
fi

git commit -a
if [ "${merge_master}" = "1" ] ; then
  git checkout $master
  git merge build_${build}
  exit 0
fi

git checkout dev
git merge build_${build}
git push origin dev
git push ii dev
git checkout build_${build}
#git push origin build_${b}
#git push ii build_${b}
