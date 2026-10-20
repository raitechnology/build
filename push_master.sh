
case ${1} in
  raimd)
  m=master
  ;;
  raikv)
  m=master
  ;;
  sassrv)
  m=master
  ;;
  raids)
  m=master
  ;;
  natsmd)
  m=master
  ;;
  raims)
  m=master
  ;;
  omm)
  m=main
  ;;
  rvcache)
  m=main
  ;;
  raimdapi)
  m=master
  ;;
  ossl)
  m=main
  ;;
  *)
  echo "arg1: raimd, raikv, sassrv, raids, natsmd, raims, omm, rvcache, raimdapi, ossl"
  exit 1
esac

make dirs
cd $1
#git checkout master
#git merge dev
build_num=$(sed -n 's/^[[:space:]]*build_num[[:space:]]*:=[[:space:]]*\([0-9][0-9]*\)[[:space:]]*$/\1/p' .copr/Makefile)
git commit -a
git push origin $m
git push ii $m
git push origin build_${build_num}
git push ii $m build_${build_num}
