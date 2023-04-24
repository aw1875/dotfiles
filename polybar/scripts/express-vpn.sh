#!/bin/sh

STATUS=$(echo $(expressvpn status | head -n1 | cut -d '-' -f2 | sed 's/\.//g' | sed 's/\x1B\[[0-9;]*[m]//g'))

expressvpn_toggle() {
    if [ "$STATUS" != 'Not connected' ]; then
        expressvpn disconnect
    else
        expressvpn connect cato
    fi
}

expressvpn_status() {
    if [ "$STATUS" == 'Not connected' ]; then
        echo "%{F#E06C75}%{T1}󰖂  $STATUS"
    elif [ "$STATUS" == 'Connecting' ]; then
        echo "%{F#D19A66}%{T1}󰖂  $STATUS"
    else
        echo "%{F#98C379}%{T1}󰖂  $STATUS"
    fi
}

case "$1" in
    --toggle)
        expressvpn_toggle
    ;;
    *)
        expressvpn_status
    ;;
esac
