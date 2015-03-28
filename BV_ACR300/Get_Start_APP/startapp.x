#! /bin/sh

cdate=$(date "+%m-%d")

loglevel=4

if [[ -n $1 ]]; then
  if [[ $1 -gt 0 ]] && [[ $1 -lt 3 ]]
      then
        loglevel=$1
  fi
fi

# echo "loglevel is "$loglevel

cd /mnt/disk0/afc/bin/

echo "======== Turn to start APP ================>>>>>>>>"
echo
echo 

./afc_app.x-$cdate-release -recordlog $loglevel
