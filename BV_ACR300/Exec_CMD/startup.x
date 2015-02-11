#!/bin/sh

lcd_print.x "RM spi file ..."

rm /mnt/disk1/afc/.spi

if [ $? -eq 0 ]; then
    lcd_print.x "RM success. "
else
    lcd_print.x "RM Fail. "
fi
