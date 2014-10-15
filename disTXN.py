#! /usr/bin/python
#coding: UTF-8

print "Display txn file"

import time

print time.time()

txnfile = open("Code_template.cpp","rb")

print txnfile.readline()

