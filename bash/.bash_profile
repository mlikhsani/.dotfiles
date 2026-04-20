# .bashrc add to .bash_profile
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

export QT_QPA_PLATFORMTHEME=qt6ct

# Automatic start window manager
if [ -z "$DISPLAY" ] && [ $(tty) = /dev/ttyv0 ]; then
    exec dbus-launch --exit-with-session sway
fi
