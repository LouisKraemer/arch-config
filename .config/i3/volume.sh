#!/bin/zsh

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

function get_volume() {
	pamixer --get-volume
}

function is_mute() {
	pamixer --get-mute
}

function send_notification() {
	volume=$(get_volume)
	# Make the bar with the special character ─ (it's not dash -)
	# https://en.wikipedia.org/wiki/Box-drawing_character
	if is_mute; then
		icon=$ICON/volume-mute.png
		bar=$(seq -s " " 21 | sed 's/[0-9]//g')
	else
		bar1=$(seq -s "─" $(($volume / 5 + 1)) | sed 's/[0-9]//g')
		bar2=$(seq -s " " $(($volume / 5 + 1)) 21 | sed 's/[0-9]//g')
		end="end"
		bar=$bar1$bar2
		print ${#bar}
		case $volume in
		0)
			icon=$ICON/volume-mute.png
			;;
		[1-9] | [1-2][0-9] | 30)
			icon=$ICON/volume-off.png
			;;
		31 | [3-5][0-9] | 60)
			icon=$ICON/volume-down.png
			;;
		61 | [6-9][0-9] | 100)
			icon=$ICON/volume-up.png
			;;
		esac
	fi
	# Send the notification
	dunstify -i $icon -r 9999 -t 1000 $bar
}

case $1 in
up)
	pamixer -u -i 5
	send_notification
	;;
down)
	pamixer -u -d 5
	send_notification
	;;
mute)
	pamixer -t
	send_notification
	;;
esac
