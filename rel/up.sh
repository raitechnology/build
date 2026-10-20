#!/bin/bash

base=$(basename $PWD)
if [ $base = "rel" ] ; then
  name=repo
else
  name=dev
fi
export name
export repo=www:/home/raitechnology.com/$name/
export repo2=pumpkin:/home/raitechnology.com/$name/

createrepo7()
{
  createrepo_c --compatibility $1
#  ssh epel-7 createrepo injinj/rel/epel-7-x86_64
}

mkrepo()
{
  /bin/rm -r -f $1/repodata
  $2 $1
cat > raitechnology_${1}.repo <<xxx
[raitechnology]
name=Rai Technology ${1}
baseurl=https://www.raitechnology.com/$name/${1}
enabled=1
gpgcheck=1
gpgkey=https://www.raitechnology.com/$name/RPM-GPG-KEY-raitechnology
xxx
  rsync -av raitechnology_${1}.repo ${repo}
cat > raitechnology_${1}.repo <<xxx
[raitechnology]
name=Rai Technology ${1}
baseurl=https://pumpkin.rai.technology/$name/${1}
enabled=1
gpgcheck=1
gpgkey=https://pumpkin.rai.technology/$name/RPM-GPG-KEY-raitechnology
xxx
  rsync -av raitechnology_${1}.repo ${repo2}
  rsync -av $1 ${repo}
  rsync -av $1 ${repo2}
  rm -f raitechnology_${1}.repo
}

mkrepo epel-7-x86_64 createrepo7
mkrepo epel-8-x86_64 createrepo
mkrepo epel-9-x86_64 createrepo
mkrepo epel-10-x86_64 createrepo

for i in fedora*-x86_64 ;
do
  mkrepo $i createrepo
done
