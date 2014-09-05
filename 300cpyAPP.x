#! /bin/sh

# Create by Vince. 2014-09-03
# FUNCTION:
# 1, copy the lastest compile app to target machine

IP=$1
mode=$2

cdate=$(date "+%m-%d")

# Display the command when running.
#set -v off

echo "Start copy $mode app to 192.168.1.$IP ..."
echo "The copy date is $cdate ."

if [ ! $mode ]; then
    echo "cp /home/vince/Projects/acr300/apps/afc/bin/afc_app.x root@192.168.1.$IP:/mnt/disk0/afc/bin/afc_app.x-$cdate"
    cp /home/vince/Projects/acr300/apps/afc/bin/afc_app.x root@192.168.1.$IP:/mnt/disk0/afc/bin/afc_app.x-$cdate
fi

if [ $mode == "release" ]; then
    echo "scp /home/vince/Projects/acr300/apps/afc/src/Release/afc_app.x root@192.168.1.$IP:/mnt/disk0/afc/bin/afc_app.x-$cdate-$mode"
    scp /home/vince/Projects/acr300/apps/afc/src/Release/afc_app.x root@192.168.1.$IP:/mnt/disk0/afc/bin/afc_app.x-$cdate-$mode
fi

if [ $mode == "debug" ]; then
    echo "scp /home/vince/Projects/acr300/apps/afc/src/Debug/afc_app.x root@192.168.1.$IP:/mnt/disk0/afc/bin/afc_app.x-$cdate-$mode"
    scp /home/vince/Projects/acr300/apps/afc/src/Debug/afc_app.x root@192.168.1.$IP:/mnt/disk0/afc/bin/afc_app.x-$cdate-$mode
fi  

if [ $? == 0 ]; then
    echo "Copy done."
else
    echo "Copy Failure."
fi
