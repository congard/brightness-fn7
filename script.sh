#!/bin/bash

# Script by Daniel Bernar (congard)
# dbcongard@gmail.com
# https://gitlab.com/congard
# http://congard.pp.ua
# Payeer: P36281059

minLevel=0.075
maxLevel=1.0

if [ "$1" != "" ]
then
    minLevel=$1
fi

if [ "$2" != "" ]
then
    maxLevel=$2
fi

currentLevel=$(xrandr --current --verbose | grep -m 1 'Brightness:' | cut -f2- -d:)
connected=$(xrandr | grep " connected " | awk '{ print$1 }')

brightness=$minLevel

if [ "$(echo $currentLevel '!=' $maxLevel | bc -l)" = "1" ]
then
    brightness=$maxLevel
fi

xrandr --output $connected --brightness $brightness
