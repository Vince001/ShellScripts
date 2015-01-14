#! /bin/sh

# Vince 2014-12-04 Create.
# 1, install ssh tool to BV.

# ---- kill APP
killall -q afc_app.x
sync

# ---- Install SSH
if [ -e local.tar ]; then
    lcd_print.x "Start copy ..."

    cp local.tar /mnt/disk2/
    
    lcd_print.x "Start install ..."

    cd /mnt/disk2/

    tar -xvf local.tar

    if [ $? == 0 ]; then
        sync
        lcd_print.x "Install SSH success!"
    fi
else
    lcd_print.x "local.tar is not exist!"
fi
