#!/bin/bash

for i in app/*{1..10}.txt
do

        chmod 0444 $i

done
