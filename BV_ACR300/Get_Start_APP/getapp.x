#! /bin/sh

# Create by Vince. 2015-01-14
# FUNCTION:
# 1, get the lastest compile app from PC

IP=$1
mode=$2

cdate=$(date "+%m-%d")

# Display the command when running.
#set -v off

echo "Start copy $mode app from 192.168.1.$IP ..."
echo "The copy date is $cdate ."

if [ ! $mode ]; then
    echo "scp vince@192.168.1.$IP:/home/vince/Projects/acr300/apps/afc/bin/afc_app.x /mnt/disk0/afc/bin/afc_app.x-$cdate"
    scp vince@192.168.1.$IP:/home/vince/Projects/acr300/apps/afc/bin/afc_app.x /mnt/disk0/afc/bin/afc_app.x-$cdate
fi

if [ $mode == "release" ]; then
    echo "scp vince@192.168.1.$IP:/home/vince/Projects/acr300/apps/afc/src/Release/afc_app.x /mnt/disk0/afc/bin/afc_app.x-$cdate-$mode"
    scp vince@192.168.1.$IP:/home/vince/Projects/acr300/apps/afc/src/Release/afc_app.x /mnt/disk0/afc/bin/afc_app.x-$cdate-$mode
fi

if [ $mode == "debug" ]; then
    echo "scp vince@192.168.1.$IP:/home/vince/Projects/acr300/apps/afc/src/Debug/afc_app.x /mnt/disk0/afc/bin/afc_app.x-$cdate-$mode"
    scp vince@192.168.1.$IP:/home/vince/Projects/acr300/apps/afc/src/Debug/afc_app.x /mnt/disk0/afc/bin/afc_app.x-$cdate-$mode
fi  

if [ $? == 0 ]; then
    echo "Copy done."
else
    echo "Copy Failure."
fi
