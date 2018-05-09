#!/bin/zsh

/usr/bin/i3lock -e -i /home/louis/Pictures/background-lock.jpg --clock \
	--timestr="%H:%M" --timecolor=ffffffff --timesize=60 \
	--timepos="x+w/2:y+2*h/5" --datepos="tx: ty+60" \
	--datestr="%e %b %Y" --datecolor=ffffffff --datesize=40 \
	--ringcolor=37474f00 --insidecolor=37474f00 --linecolor=00000000 \
	--insidevercolor=37474f00 --insidewrongcolor=b71c1c00 \
	--indpos="x+w/2:y+2*h/3" \
	--ringvercolor=37474fbf --ringwrongcolor=b71c1cbf \
	--keyhlcolor=ffffffff --separatorcolor=00000000 \
	--wrongtext="" --veriftext="" --radius=70 --ring-width=6.0
