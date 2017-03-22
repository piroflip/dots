#==============================
# General (for any X session) {{{
#==============================
xrdb -load ~/.Xresources

setxkbmap -I$HOME/.config/xkb -symbols piroflip -print | xkbcomp -I"$HOME/.config/xkb" - "${DISPLAY%%.*}"

# restore background image/settings
if [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/setroot/.setroot-restore" ]; then
	setroot --restore
else
	setroot --bg-color "#00ff00"
fi

# font stuff
xset +fp /usr/share/fonts/local
xset +fp ~/.fonts
xset fp rehash
# faster key repeat rate and shorter delay (default is 660 25); messing around with
xset r rate 300 35
# die bell
xset -b
# energy star features on
xset +dpms
# standby suspend and off; no difference for lcds apparently; blank screen after 5 minutes of inactivity
xset dpms 0 0 300

# disable system mouse acceleration
xset mouse 0 0

# set cursor look
xsetroot -cursor_name left_ptr &
# remove cursor after some time
unclutter -idle 1 &

# redshift; better options at this point than xflux
#redshift -c ~/.config/redshift.conf &
# }}}

#==============================
# TTY Specific {{{
#==============================
if [ "$(tty)" = "/dev/tty1" ]; then
	# compositing.. transparency, fade-in, etc.
	# will mess things up if run with a DE like gnome or cinnamon
	compton -b &

	# sleep after 20 minutes of inactivity
	xautolock -time 20 -locker "pm-suspend" -detectsleep &

	# notification daemon
	#dunst &
	# notifications on mpd song changes
	# https://github.com/vehk/mpdnotify works well with mpdcron also
	#mpd-notification -m "${XDG_MUSIC_DIR:-$HOME/music}" &

	# backup hotkey program
	#xchainkeys &
	# hotkeys
	sxhkd &

	# start window manager
	case $1 in
		hlwm) exec herbstluftwm --locked;;
		bspwm) exec bspwm &>~/bspwm.log;;
		i3) exec i3;;
		# vb) VirtualBox -startvm "Windows 7" -fullscreen;;
		*) exec bspwm &>~/bspwm.log;;
	esac
fi
# }}}
#==============================
