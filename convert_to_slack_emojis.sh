#!/bin/bash

rm -fr slackables
mkdir slackables

cp gifs/*.gif slackables/

# hand curated list of modifications to gifs
declare -A FIXES

FIXES["adventure-time-pusheen.gif"]="-shave 0x50"
FIXES["back-to-school-pusheen.gif"]="-shave 0x25"
FIXES["bacon-pusheen.gif"]="-gravity north -extent 0x200"
FIXES["badmington-pusheen.gif"]="-gravity north -extent 0x200"
FIXES["baker-pusheen.gif"]="-gravity north -extent 0x235"
FIXES["bathe-in-a-teacup-pusheen.gif"]="-shave 0x70"
FIXES["blogger-pusheen.gif"]="-shave 0x55"
FIXES["box-of-pusheens.gif"]="-shave 0x30"
FIXES["bread-pusheen.gif"]="-shave 0x50"
FIXES["bulbasaur-pusheen.gif"]="-shave 0x40"
FIXES["cheetos-eating-pusheen.gif"]="-shave 0x20"
FIXES["chips-eating-pusheen.gif"]="-gravity north -extent 0x190"
FIXES["cookie-eating-pusheen.gif"]="-shave 0x25"
FIXES["cookies-eating-pusheen.gif"]="-shave 0x20 -gravity north -extent 0x200"
FIXES["cupcake-pusheen.gif"]="-shave 0x25"
FIXES["dance-pusheen.gif"]="-shave 0x25"
FIXES["deal-with-it-pusheen.gif"]="-shave 0x55"
FIXES["dinosaur-pusheen.gif"]="-gravity south -extent 0x190"
FIXES["dj-pusheen.gif"]="-gravity north -extent 0x200"
FIXES["donuts-pusheen.gif"]="-gravity north -extent 0x200"
FIXES["dragonborn-pusheen.gif"]="-gravity north -extent 0x280"
FIXES["ducklings-pusheen.gif"]="-gravity south -extent 0x190 -shave 0x10"
FIXES["easter-cat-pusheen.gif"]="-shave 0x15"
FIXES["eat-pie-pusheen.gif"]="-gravity north -extent 0x180"
FIXES["eat-some-bbq-pusheen.gif"]="-gravity north -extent 0x260"
FIXES["eating-pizza-pusheen.gif"]="-shave 0x25"
FIXES["exercising-pusheen.gif"]=""
FIXES["family-pusheen.gif"]="-shave 0x48"
FIXES["fast-food-pusheen.gif"]="-shave 0x35"
FIXES["fat-fish-pusheen.gif"]="-shave 0x40"
FIXES["fat-pony-pusheen.gif"]="-shave 0x45"
FIXES["fat-pusheen.gif"]=""
FIXES["fat-tree-pusheen.gif"]="-shave 0x20"
FIXES["gagnam-style-pusheen.gif"]="-shave 0x20"
FIXES["gentlemen-pusheen.gif"]="-shave 0x15"
FIXES["ghost-pusheen.gif"]="-shave 0x55"
FIXES["glitched-pusheen.gif"]="-shave 0x70"
FIXES["hair-brush-pusheen.gif"]="-shave 0x30"
FIXES["hairy-pusheen.gif"]="-shave 0x30"
FIXES["hamburger-pusheen.gif"]="-shave 0x25"
FIXES["happy-birthday-pusheen.gif"]="-shave 0x30"
FIXES["happy-fathers-day-pusheen.gif"]=""
FIXES["harry-potter-pusheen.gif"]="-gravity south -extent 0x240 -shave 0x63"
FIXES["haters-gonna-hate-pusheen.gif"]="-shave 0x55"
FIXES["having-fun-pusheen.gif"]="-shave 0x15"
FIXES["home-is-where-my-butt-is-pusheen.gif"]="-shave 0x20"
FIXES["hot-cocoa-pusheen.gif"]="-shave 0x20"
FIXES["i-want-more-food-pusheen.gif"]="-gravity north -extent 0x160"
FIXES["inspecting-pusheen.gif"]="-shave 0x20"
FIXES["iphone-loving-pusheen.gif"]="-gravity south -extent 0x250 -shave 0x20"
FIXES["kneading-pusheen.gif"]="-shave 0x20"
FIXES["me-gusta-pusheen.gif"]="-shave 0x50"
FIXES["meteor-pusheen.gif"]=""
FIXES["mexican-pusheen.gif"]="-shave 0x02"
FIXES["mummy-pusheen.gif"]="-shave 0x55"
FIXES["need-ice-cream-pusheen.gif"]="-shave 0x55"
FIXES["nice-hat-pusheen.gif"]="-shave 0x50"
FIXES["nope-pusheen.gif"]="-shave 0x50"
FIXES["nuh-uh-pusheen.gif"]="-shave 0x50"
FIXES["nutella-costume-pusheen.gif"]="-gravity north -extent 0x200"
FIXES["nyan-cat-costume-pusheen.gif"]="-gravity north -extent 0x200"
FIXES["nyan-cat-pusheen.gif"]="-shave 0x50"
FIXES["painting-pusheen.gif"]="-shave 0x25"
FIXES["party-pusheen.gif"]="-gravity north -extent 0x200"
FIXES["peep-eating-pusheen.gif"]="-shave 0x20"
FIXES["pianist-pusheen.gif"]="-shave 0x10"
FIXES["pikachu-pusheen.gif"]="-shave 0x20"
FIXES["pizza-eating-pusheen.gif"]="-shave 0x25"
FIXES["pizza-umbrella-pusheen.gif"]="-gravity north -extent 0x200"
FIXES["poweuff-girls-pusheen.gif"]="-gravity north -extent 0x200"
FIXES["purrity-pusheen.gif"]="-shave 0x55"
FIXES["r2d2-pusheen.gif"]=""
FIXES["rainbow-pastel-unicorn-pusheen.gif"]="-shave 0x25"
FIXES["ramen-eating-pusheen.gif"]="-shave 0x25"
FIXES["sailor-moon-pusheen.gif"]="-gravity north -extent 0x200"
FIXES["scooter-pusheen.gif"]="-shave 0x25"
FIXES["sculptor-pusheen.gif"]="-gravity north -extent 0x190"
FIXES["sleeping-pusheen.gif"]="-gravity south -extent 0x200 -shave 0x20"
FIXES["so-lazy-cant-move-pusheen.gif"]="-shave 0x70"
FIXES["super-hero-pusheen.gif"]="-gravity north -extent 0x200"
FIXES["super-lazy-pusheen.gif"]="-shave 0x55"
FIXES["sushi-pusheen.gif"]="-shave 0x20"
FIXES["t-rex-costume-pusheen.gif"]="-gravity north -extent 0x200"
FIXES["thank-you-pusheen.gif"]="-shave 0x20"
FIXES["thinking-of-pizza-pusheen.gif"]="-shave 0x20"
FIXES["tumblr-pusheen.gif"]="-shave 0x20"
FIXES["valentines-day-pusheen.gif"]="-shave 0x10"
FIXES["voting-pusheen.gif"]="-shave 0x20"
FIXES["wake-me-up-after-winter-pusheen.gif"]="-shave 0x20"
FIXES["want-cookies-pusheen.gif"]="-shave 0x20"
FIXES["will-you-be-mine-pusheen.gif"]="-shave 0x20"
FIXES["writing-pusheen.gif"]="-shave 0x20"
FIXES["y-u-no-feed-me-pusheen.gif"]="-shave 0x50"

for FILE in `ls slackables`
do
    echo "Applying fixes to $FILE"
    convert "slackables/$FILE" ${FIXES[$FILE]} "slackables/$FILE"
done

for FILE in slackables/*.gif
do
    echo "Handling $FILE"

    rm -fr tmp
    mkdir tmp
    echo "Splitting $FILE into frames"
    convert -coalesce $FILE tmp/frames%05d.png

    echo "Resizing frames of $FILE"
    for PNG in tmp/*.png
    do
        BG_COLOR=`convert $PNG -crop '1x1+0+0' txt:- | head -2 | tail -1 | awk '{print $3}'`
        convert $PNG -fuzz 3% -transparent $BG_COLOR $PNG
    done

    echo "Merging frames of $FILE into into GIF"
    convert $(for a in tmp/*.png; do printf -- "-delay 15 -dispose background %s " $a; done;) $FILE
    convert $FILE -colorspace RGB -background none -resize 128x128\! -gravity center -extent 128x128 -colorspace sRGB $FILE
    rm -fr tmp
done
