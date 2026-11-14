
master=master
pull=0

opt=${1:?usage: $0 [-p pull] repo}
case $opt in
  -p)
  pull=1
  shift
  ;;
esac

name=${1:?usage: $0 [-p pull] repo}

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

#make dirs
cd $name
#git checkout master
#git merge dev
build=$(sed -n 's/^[[:space:]]*build_num[[:space:]]*:=[[:space:]]*\([0-9][0-9]*\)[[:space:]]*$/\1/p' .copr/Makefile)

if [ "${pull}" = "1" ] ; then
  build_num=$(($build + 1))
  git pull origin build_${build_num}
  git pull origin ${master}
  exit 0
fi

git commit -a
git push origin ${master}
git push ii ${master}
git push origin build_${build}
git push ii build_${build}
