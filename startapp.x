#! /bin/sh

loglevel=4

if [ $1 -gt 0 ] && [ $1 -lt 5 ]
    then
      loglevel=$1
fi

echo "loglevel is "$loglevel

#cd /mnt/disk0/afc/bin/

echo "======== Turn to start APP ================>>>>>>>>"
echo
echo 

#./afc_app.x-10-30-release -recordlog $loglevel
