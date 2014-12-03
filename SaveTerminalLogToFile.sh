#! /bin/bash

# Vince 2014-12-02 created.
# 1, Saving terminal interactive sessions to file which named by current date & time.

echo "[Setting] Save log to file. "

LogFileName=$(date +"%Y%m%d-%H%M%S").log

script -f ~/TerminalLog/$LogFileName

# simple script -f ~/TerminalLog/$(date +"%Y%m%d-%H%M%S").log
