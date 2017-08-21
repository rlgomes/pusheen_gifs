#!/bin/bash

rm -fr slackables
mkdir slackables
cp gifs/*.gif slackables/

for FILE in slackables/*.gif
do
    echo "Handling $FILE"

    rm -fr tmp
    mkdir tmp
    echo "Splitting $FILE"
    convert -coalesce $FILE tmp/frames%05d.png

    for PNG in tmp/*.png
    do
        BG_COLOR=`convert $PNG -crop '1x1+0+0' txt:- | head -2 | tail -1 | awk '{print $3}'`
        convert $PNG -resize 128x128 -fuzz 5% -transparent $BG_COLOR $PNG
    done

    convert $(for a in tmp/*.png; do printf -- "-delay 10 -dispose background %s " $a; done;) $FILE
    rm -fr tmp
done
