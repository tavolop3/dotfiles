#!/bin/bash

options="⏻ Power Off
 Reboot
⏾ Suspend
⏼ Hibernate
⏏ Logout
 Lock"

chosen=$(echo -e "$options" | rofi -dmenu -p "Power Menu:" -lines 6 -padding 0 -matching fuzzy -filter "" -theme-str 'window {width: 20%;}')

case "$chosen" in
    "⏻ Power Off")
        systemctl poweroff
        ;;
    " Reboot")
        systemctl reboot
        ;;
    "⏾ Suspend")
        systemctl suspend
        ;;
    "⏼ Hibernate")
        systemctl hibernate
        ;;
    "⏏ Logout")
        hyprctl dispatch exit
        ;;
    " Lock")
        swaylock -f --color=282828cc
        ;;
    *)
        ;;
esac

