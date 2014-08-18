#! /bin/bash

GoAgent=/home/vince/Projects/google_appengine/goagent/local

cd $GoAgent

sudo python proxy.py
# todo add auto authenticate, yes or expect ?
