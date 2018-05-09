#!/bin/zsh

function get_bright {
    light -G
}

function send_notification {
    brightness=`get_bright`
    # Make the bar with the special character ─ (it's not dash -)
    # https://en.wikipedia.org/wiki/Box-drawing_character
    roundBrightness=$(echo "($brightness/5)/1" | bc)
    bar=$(seq -s "─" $(($roundBrightness)) | sed 's/[0-9]//g')
    # Send the notification
    dunstify -i display-brightness-symbolic -r 9999 -t 1500 " $bar"
}

case $1 in
    up)
	light -A 10
	send_notification
	;;
    down)
	light -U 10
	send_notification
	;;
esac
