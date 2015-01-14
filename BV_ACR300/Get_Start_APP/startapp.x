#! /bin/sh

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

./afc_app.x-12-04-release -recordlog $loglevel
