#! /usr/bin/env zsh
#echo "" | rofi -dmenu | xargs -I{} xdg-open "https://www.google.de/search?q={}"
s=`rofi -dmenu -p "Google Search"`
if [[ -z $s ]];then
    exit
fi

xdg-open "https://www.google.de/search?q=$s"
xte 'keydown Super_L' 'keydown 2' 'keyup Super_L' 'keyup 2'
