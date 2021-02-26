#!/bin/bash

copr-cli list-packages --with-latest-build gold > pkgs.json
name=($(jq '.[].name' < pkgs.json))
ver=($(jq '.[].latest_build.source_package.version' < pkgs.json))
build=($(jq '.[].latest_build.id' < pkgs.json))

echo found packages: ${name[@]}
echo found versions: ${ver[@]}
echo found builds:   ${build[@]}

count=${#name[@]}
need=()

for (( i=0; i<${count}; i++ ));
do
  chroots=($(jq ".[$i].latest_build.chroots[]" < pkgs.json))
  ndist=${#chroots[@]}
  ver2=$(sed 's/.fc[0-9][0-9]//' <<< ${ver[$i]})
  for (( j=0; j<${ndist}; j++ ));
  do
    f=$(sed 's/"//g' <<< ${chroots[$j]}/${name[$i]}-${ver2})
    if [ ! -f ${f}.*.x86_64.rpm ] ; then
      need+=(${build[$i]})
      break
    fi
  done
done

count=${#need[@]}
echo download builds: ${need[@]}

for (( i=0; i<${count}; i++ ));
do
  copr-cli download-build ${need[$i]}
  rm -f *-x86_64/*.gz *-x86_64/*.log *-x86_64/*.spec *-x86_64/chroot_scan
  rm -f *-x86_64/success *-x86_64/*.html *-x86_64/*.info
done

find *-x86_64 -name '*.rpm' -newer pkgs.json -exec rpm --addsign {} \;

rm -f pkgs.json

newest=$(cd epel-7-x86_64 ; /bin/ls -t1 nats-server-*-amd64.rpm | head -1)
echo found nats-server: $newest
rpm --addsign epel-7-x86_64/$newest

for i in *-x86_64 ;
do
cat > raitechnology_${i}.repo <<xxx
[raitechnology]
name=Rai Technology ${i}
baseurl=https://www.raitechnology.com/repo/${i}
enabled=1
gpgcheck=1
gpgkey=https://www.raitechnology.com/repo/RPM-GPG-KEY-raitechnology
xxx
done

for i in *-x86_64 ;
do
  if [ ! -f $i/$newest ] ; then
    cp -a epel-7-x86_64/$newest $i/
  fi
  /bin/rm -r -f $i/repodata
  createrepo $i
  rsync -av raitechnology_${i}.repo pumpkin:/home/raitechnology.com/repo/
  rsync -av $i pumpkin:/home/raitechnology.com/repo/
  rsync -av doc/index.html pumpkin:/home/raitechnology.com/repo/index.html
  rsync -av doc/docbook-xsl.css pumpkin:/home/raitechnology.com/repo/docbook-xsl.css
  rm -f raitechnology_${i}.repo
done
