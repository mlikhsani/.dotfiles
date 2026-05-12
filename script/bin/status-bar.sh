#!/bin/sh

__battery() {
    PERC=$(sysctl -n hw.acpi.battery.life)
    if [ ${PERC} -lt 100 ]; then
        PERC="${PERC}%"
    fi
        echo -n "BAT*${PERC}" # make both have same total characters
}

__date() {
    echo -n $(date '+%a %b*%d %H:%M:%S')
}

__temperature() {
    TEMP=$(sysctl -n dev.amdtemp.0.core0.sensor0)
    echo -n "TMP*${TEMP}"
}

__volume() {
    VOL=$(mixer -o vol.volume | awk -F'[=:]' '{print $2*100}')

    if [ ${VOL} -lt 100 ]; then
        VOL="${VOL}%"  
    fi

    case $(mixer -o vol.mute | sed 's/vol.mute=//') in
    off)
        echo -n "VOL*${VOL}v"
        ;;
    on)
        echo -n "VOL*${VOL}m"
        ;;
    esac
}

while true; do
    # Max vertical lenght dzen2 can provide in this monitor is 47 (add space 
    # if not 47). All output character must be 47 in total after modified by
    # sed, if there is a missmatch between output whether less than or larger
    # than 47, the output will show unintended result. 

    echo "$(__date) $(__battery) $(__temperature) $(__volume) " | sed 's/./&\n/g'

    sleep 1
done
