#!/bin/sh

echo $(df -h / | awk '{ print "Mount " $6 " | " $4 " | " $5 }' | tail -n 1)
