#!/bin/bash

sleep 2
DEVICEDIR=/sys/bus/hid/devices

for i in `find $DEVICEDIR/*/input/input*/ -maxdepth 1 -name "js?" -type d`
do

  IFS='/' read -a myarray <<< "$i"
  id=${myarray[5]};
  js=${myarray[8]:2};

  for j in {0..3}
  do
    bright="$DEVICEDIR/$id/leds/$id:blue:p$j/brightness"
    if [ -e "$bright" ]
    then
      (( level = $j==$js ? 255 : 0 ))
      echo $level > $bright
    fi
  done

done
