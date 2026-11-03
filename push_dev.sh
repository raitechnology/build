
raimd=58
raikv=134
sassrv=87
raids=102
natsmd=72
raims=113
omm=26
rvcache=8
raimdapi=5
ossl=2
merge_master=0
master=master
rebuild=0

if [ ${1} == "-m" ] ; then
  merge_master=1
  shift
fi

if [ ${1} == "-b" ] ; then
  rebuild=1
  shift
fi

case ${1} in
  raimd)
  b=${raimd}
  ;;
  raikv)
  b=${raikv}
  ;;
  sassrv)
  b=${sassrv}
  ;;
  raids)
  b=${raids}
  ;;
  natsmd)
  b=${natsmd}
  ;;
  raims)
  b=${raims}
  ;;
  omm)
  b=${omm}
  master=main
  ;;
  raimdapi)
  b=${raimdapi}
  ;;
  ossl)
  b=${ossl}
  master=main
  ;;
  rvcache)
  b=${rvcache}
  master=main
  ;;
  *)
  echo "arg1: raikv, sassrv, raids, natsmd, raims, raimd, omm, ossl, rvcache"
  exit 1
esac

#/bin/rm -f *x86_64*/*${1}*
#find src_rpm -name "${1}*" -exec rm -f {} \;
#find rpm_build -name "${1}*" -exec rm -r -f {} \;

make dirs
cd $1

if [ ${rebuild} == "1" ] ; then
  rm -f CMakeLists.txt
  rm -r -f FC*_x86_64*
  make
else
  git commit -a
  if [ ${merge_master} == "1" ] ; then
    git checkout $master
    git merge build_${b}
  else
    git checkout dev
    git merge build_${b}
    git push origin dev
    git push ii dev
    git checkout build_${b}
    #git push origin build_${b}
    #git push ii build_${b}
  fi
fi
