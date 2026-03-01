#!/bin/sh
# ----------------------------------
# SHOW STATUS TO STDOUT
# dependencies:
# - dzen2
# ----------------------------------

# CUSTOM MATH FUNCTION
__math() {
    local SCALE=1
    local RESULT=$(echo "scale=${SCALE}; ${@}" | bc -l)
    if echo ${RESULT} | grep --color -q '^\.'; then
        echo -n 0
    fi
    echo ${RESULT}
    unset SCALE
    unset RESULT
}

__dns() {
    # ONLY FIRST DNS FROM /etc/resolv.conf FILE
    NS=$(awk '/^nameserver/ {print $2; exit}' /etc/resolv.conf)
    if [ -z "${NS}" ]; then
        NS=-
    fi
    echo -n "${NS}"
}

__gateway() {
    GW=$(route -n -4 -v get default 2>/dev/null | awk 'FNR == 4 {print $2}')
    if [ -z "${GW}" ]; then
        GW=-
    fi
    echo -n "${GW}"
}

__ssid() {
    SSID=$(ifconfig wlan0 | sed -n 's/.*ssid "\(.*\)".*/\1/p')
    if [ -z "${SSID}" ]; then
        SSID=-
    fi
    echo -n "${SSID}"
}

__volume() {
    VOL=$(mixer -o vol.volume | awk -F'[=:]' '{print $2*100}')

    case $(mixer -o vol.mute | sed 's/vol.mute=//') in
    off)
        echo "${VOL}"
        ;;
    on)
        echo "(M)${VOL}"
        ;;
    esac
}

__battery() {
    PERC=$(sysctl -n hw.acpi.battery.life)
    case $(sysctl -n hw.acpi.acline) in
    1)
        echo "AC/${PERC}%"
        ;;

    0)
        TIME=$(sysctl -n hw.acpi.battery.time)
        if [ "${TIME}" != "-1" ]; then
            HOUR=$((${TIME} / 60))
            MINS=$((${TIME} % 60))
            [ ${MINS} -lt 10 ] && MINS="0${MINS}"
        else
            HOUR=??
            MINS=??
        fi

        if [ "${PERC}" -lt 20 ]; then
            echo "${HOUR}:${MINS}/${PERC}%"
        else
            echo "${HOUR}:${MINS}/${PERC}%"
        fi
        ;;
    esac
}

# GATHERING DATA AND SHOW DATA
while :; do

    DATE=$(date "+%Y-%m-%d,%a %H:%M")
    FREQ=$(sysctl -n dev.cpu.0.freq)
    TEMP=$(sysctl -n dev.amdtemp.0.core0.sensor0)
    LOAD=$(sysctl -n vm.loadavg | awk '{print $2}')
    MEM=$(($(sysctl -n vm.stats.vm.v_inactive_count) + \
    $(sysctl -n vm.stats.vm.v_free_count) + \
    $(sysctl -n vm.stats.vm.v_cache_count)))
    MEM=$(__math ${MEM} \* 4 / 1024 / 1024)
    FS=$(zfs list -H -d 0 -o name,avail | awk '{printf("%s/%s ",$1,$2)}')
    PS=$(ps ax -o %cpu,rss,comm | sed 1d | grep -v 'idle$' | sort -r -n |
        head -3 | awk '{printf("%s/%d%%/%.1fGB ",$3,$1,$2/1024/1024)}')

    echo -n "│ SSID:$(__ssid) "
    echo -n "│ GW:$(__gateway) "
    echo -n "│ DNS:$(__dns) "
    echo -n "│ SYS:${FREQ}MHz/${TEMP}/${LOAD}/${MEM}GB "
    echo -n "│ FS:${FS}" # no need suffix space
    echo -n "│ VOL:$(__volume) "
    echo -n "│ BAT:$(__battery) "
    echo -n "│ ${DATE}"
    echo

    sleep 1
done
