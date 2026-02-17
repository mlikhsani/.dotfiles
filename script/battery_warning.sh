#!/bin/sh

#=====================================================================
# BATTERY WARNING VIA NOTIFY-SEND
#=====================================================================

while :; do

	PERC=$(sysctl -n hw.acpi.battery.life)
	AC=$(sysctl -n hw.acpi.acline)

	if [ "$AC" -eq 0 ] && [ "$PERC" -le 20 ]; then
		notify-send -u critical -t 4000 "WARNING" "Low battery level,\nLaptop about to die"
	fi

	sleep 5
done
