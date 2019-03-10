#!/bin/bash

bgColor=$(xrdb -query | grep "*background" | grep -o '.......$')

if [ "$bgColor" = "#282828" ]; then 
    xrdb -load $HOME/dotfiles/.Xresources-light && i3 restart
else
    xrdb -load $HOME/dotfiles/.Xresources && i3 restart
fi
