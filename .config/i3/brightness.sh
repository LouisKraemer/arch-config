#!/bin/zsh

function get_bright() {
	light -G
}

function send_notification() {
	#brightness=$(get_bright)
	# Make the bar with the special character ─ (it's not dash -)
	# https://en.wikipedia.org/wiki/Box-drawing_character
	bar=$(seq -s "─" $(($newBrightness/5)) | sed 's/[0-9]//g')

	case $roundBrightness in
	[0-9] | [1-2][0-9] | 30)
		icon=$ICON/brightness-low.png
		;;
	31 | [3-5][0-9] | 60)
		icon=$ICON/brightness-low.png
		;;
	61 | [6-9][0-9] | 100)
		icon=$ICON/brightness-low.png
		;;
	esac

	# Send the notification
	dunstify -I $icon -r 9999 -t 1500 " $bar"
}

brightness=$(get_bright)
roundBrightness=$(echo "(($brightness+1)/10)/1" | bc)

case $1 in
up)
	newBrightness=$(($roundBrightness*10+10))
	if (( $newBrightness <= 100 ))
	then
		light -S $newBrightness
	else
		newBrightness=100
	fi
	send_notification
	;;
down)
	newBrightness=$(($roundBrightness*10-10))
	if (( $newBrightness >= 0 ))
	then
		light -S $newBrightness
	else
		newBrightness=0
	fi
	send_notification
	;;
esac
