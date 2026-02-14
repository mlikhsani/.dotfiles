# .bashrc add to .bash_profile
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Automatic start window manager
if [ -z "$DISPLAY" ] && [ $(tty) = /dev/ttyv0 ]; then
    exec startx
fi
