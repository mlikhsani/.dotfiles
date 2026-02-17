#/bin/sh
# webcam script for easy use
#
# dependencies:
# - mpv (as frontend).
# - webcamd.
# - v4l-utils.
# - v4l_compat.
#
# webcamd enabled (/etc/rc.conf -> webcamd_enable="YES")

mpv av://v4l2:/dev/video0 --profile=low-latency --untimed --vf=hflip
