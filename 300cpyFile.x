#! /bin/sh

# Create by Vince. 2014-09-03
# FUNCTION:
# 1, copy file from ACR300

IP=$1
mode=$2

cdate=$(date "+%m-%d")

echo "Start copy $mode app to 192.168.1.$IP ..."

if [ mode == "" ]; then
    cp /home/vince/Projects/acr300/apps/afc/bin/afc_app.x root@192.168.1.$IP:/mnt/disk0/afc/bin/afc_app.x-$cdate
    
if [ mode == "release" ]; then
    cp /home/vince/Projects/acr300/apps/afc/src/Release/afc_app.x root@192.168.1.$IP:/mnt/disk0/afc/bin/afc_app.x-$cdate-$mode
    
if [ mode == "debug" ]; then
    cp /home/vince/Projects/acr300/apps/afc/src/Debug/afc_app.x root@192.168.1.$IP:/mnt/disk0/afc/bin/afc_app.x-$cdate-$mode
    
echo "Copy done."
