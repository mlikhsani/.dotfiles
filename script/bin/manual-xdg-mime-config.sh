#!/bin/sh
# Handmade script to manual reconfigure broken/weird xdg-mime behavior.
# If xdg-mime uses an application it shouldn't, I'll update this script.

# PDF (zathura)
xdg-mime default org.pwmt.zathura.desktop application/pdf
