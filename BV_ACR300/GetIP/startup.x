#!/bin/sh

# Please rename to startup.x in your root directory of ACR100.

#filename=$(date "+%Y-%m-%d-%H-%M-%S")
filename="ACR300_IP.txt"

#echo $filename

ifconfig >> $filename

lcd_print.x "Get IP finished."