xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Constant Deceleration" 0.95
synclient TouchpadOff=$(synclient -l | grep -c 'TouchpadOff.*=.*0')
xscreensaver -no-splash &
xss-lock -- xscreensaver-command -lock &
xbindkeys
export QT_QPA_PLATFORMTHEME=qt5ct
udisksvm -a >/dev/null &
hsetroot -full ~/us_against_the_world.jpg

#exec wmii
#exec startxfce4
#exec icewm-session
