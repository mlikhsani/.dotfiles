setxkbmap -variant dvorak
xsetroot -grey
backlight 15
sct 4000

export QT_QPA_PLATFORMTHEME=qt6ct

xbanish &
status-bar.sh | dzen2 -bg "#0000AA" -fg "#FFFFFF" -l 47 -ta c -sa c -e 'onstart=uncollapse' -w 12 -fn "Terminus:size=10:style=bold" -x 1354 -p &

exec dbus-launch --exit-with-session cwm
