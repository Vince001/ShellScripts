#! /bin/sh

loglevel=4

if [[ -n $1 ]]; then
  if [[ $1 -ge 0 ]] && [[ $1 -le 3 ]]
      then
        loglevel=$1
  fi
fi

echo "loglevel is "$loglevel

#cd /mnt/disk0/afc/bin/

echo "======== Turn to start APP ================>>>>>>>>"
echo
echo 

#./afc_app.x-10-30-release -recordlog $loglevel
