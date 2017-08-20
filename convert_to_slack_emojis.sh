#!/bin/bash

rm -fr slackables
mkdir slackables

cp gifs/*.gif slackables/

for FILE in `ls slackables`
do
    echo "Handling $FILE"
    gifsicle --resize 128x128 --colors 256 --optimize=3 slackables/$FILE -o slackables/$FILE
done
