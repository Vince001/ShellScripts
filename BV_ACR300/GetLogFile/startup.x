#!/bin/sh

# V1.0 2014-11-25 Vince created.
# 1, Copy the log of $local_date to ACR100 root dir. 

#---------------------- Init ------------------------------
# ---- Set the value to use.
local_date="20141125"
# $(date "+%Y%m%d")

#---------------------- Get System LOG to ACR100 ----------------------
cd /mnt/disk4/logs/

for logfile in `ls *`
do
    filedate=`echo ${logfile:7:8}`
    if [ $filedate == $local_date ]; then
        lcd_print.x "Find $logfile"
        cp $logfile /mnt/disk3/
    fi
done

lcd_print.x "Get log finished."
