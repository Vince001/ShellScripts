#!/bin/sh

# V1.0 2014-8-12 Vince created.
# 1,get ip address and save it in file which named by local date
# 2,get today log file(s) and save to USB disk

filename=$(date "+%Y-%m-%d-%H-%M-%S")
local_date=$(date "+%Y%m%d")
local_time=$(date "+%H%M%S")

echo $filename

ifconfig >> $filename

cd /mnt/disk4/logs/

for logfile in `ls *`
do
    filedate=`echo ${logfile:7:8}`  
    if [ $filedate == $local_date ]; then
        echo "Find $logfile"
        cp $logfile /mnt/disk3/
    fi
done

lcd_print.x "kill current process."
echo "kill current process"
x=`ps | grep  afc_app.x`
num=`echo ${x:0:5}`
kill  $num

#lcd_print.x "Getting SAM Can..."
#sleep 1

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/mnt/disk1/lib
export PATH=$PATH:/usr/local/sbin
cd /mnt/disk0/afc/bin
./afc_app.x  > /tmp/txt.x &
sleep 5
sync

x=`ps | grep  afc_app.x`
num=`echo ${x:0:5}`
kill -19 $num

lcd_print.x "Copying LOG file..."
cp /tmp/txt.x /mnt/disk3/startLOG
sleep 1

lcd_print.x "Copying LOG finished."
