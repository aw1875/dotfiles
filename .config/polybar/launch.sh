#!/usr/bin/env bash

killall -q polybar

polybar main 2>&1 | tee -a /tmp/main.log & disown
polybar secondary 2>&1 | tee -a /tmp/secondary.log & disown
