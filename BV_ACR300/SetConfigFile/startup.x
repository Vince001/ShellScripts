#! /bin/sh

cp config /mnt/disk0/afc_wifi/configs/config

if [ $? == 0 ]; then
    lcd_print.x "Set config file success!"
fi
