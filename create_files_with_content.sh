#!/bin/bash

[ -d app/ ] || mkdir -p app/

touch app/file{1..10}.txt

for i in app/*.txt
do
        echo "some content in a text" > $i
done
