#!/bin/bash

sleep 2
DEVICEDIR=/sys/bus/hid/devices

js=0
for i in `find $DEVICEDIR/*/input/input*/ -maxdepth 1 -name "js?" -type d | tac`
do

  IFS='/' read -a myarray <<< "$i"
  id=${myarray[5]};

  for j in {0..3}
  do
    bright="$DEVICEDIR/$id/leds/$id:blue:p$j/brightness"
    if [ -e "$bright" ]
    then
      (( level = $j==$js ? 255 : 0 ))
      echo $level > $bright
    fi
  done
  js=$js+1

done
