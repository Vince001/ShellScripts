#! /bin/sh

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/mnt/disk1/lib
export PATH=$PATH:/usr/local/sbin

sleep 3
killall -q afc_app.x
sync

sleep 1
if [ -e /tmp/afc_log.txt ]; then
    lcd_print.x "Copy LOG ..."
	mv /tmp/afc_log.txt /mnt/disk3
	sync
	lcd_print.x "Copy LOG Finished."
else
    cd /mnt/disk0/afc/bin
    lcd_print.x "Restart APP ..."
    ./afc_app.x -recordlog 4 > /tmp/afc_log.txt &
    sync
fi


