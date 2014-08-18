#!/bin/bash

# compare 2 dirs and list different files.

dir1=$1
dir2=$2

cd $dir1
ls > tmp1.xcc

cd ../$dir2
ls > tmp2.xcc

# todo read file to get file list
# todo whether link file 
# todo comprare
# todo list or save to file
