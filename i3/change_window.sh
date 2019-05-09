#!/usr/bin/env zsh

window=$(xdotool getwindowfocus getwindowname | grep -i chrome)
if [[ $window ]];then
    if [[ $1 == "left" ]];then
        xdotool key alt+Left
    else
        xdotool key alt+Right
    fi
else
    if [[ $1 == "left" ]];then
        xdotool key super+h
    else
        xdotool key super+l
    fi
fi

