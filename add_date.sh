#!/bin/bash


for i in /app/*{1..10}.txt

do
      f=$(basename $i)
      NEWNAME="$(date +"%R_%F_%Z_%z_${f%}")"
      mv -- "$i" "/app/$NEWNAME"

done
