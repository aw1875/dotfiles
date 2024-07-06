#!/bin/bash

STATUS=$(echo $(shockvpn status | tail -n 1 | sed 's/\.//g' | sed 's/\x1B\[[0-9;]*[m]//g' | sed 's/[0-9]*//g') 2>&1) > /dev/null

shockvpn_connect() {
    SERVERS=$(shockvpn list | awk 'NR > 2 {split($0, a, /\)/); sub(/^[[:space:]]+/, "", a[2]); print a[2]}')

    CHOSEN_LOCATION=$(rofi -dmenu -i -p "Choose a server" <<< "$SERVERS")
    [ -z "$CHOSEN_LOCATION" ] && exit

    SERVER_NAME=$(shockvpn list | awk "/$CHOSEN_LOCATION$/"| awk '{print $1}')
    [ -z "$SERVER_NAME" ] && exit

    shockvpn connect $SERVER_NAME
}

shockvpn_toggle() {
    if [ "$STATUS" == '' ]; then
        shockvpn_connect
    else
        shockvpn disconnect
    fi
}

shockvpn_status() {
    if [ "$STATUS" == '' ]; then
        echo "%{F#E06C75}%{T1}󰖂  Not Connected"
    elif [ "$STATUS" == 'Connecting' ]; then
        echo "%{F#D19A66}%{T1}󰖂  $STATUS"
    elif [ "$STATUS" == 'Disconnecting' ]; then
        echo "%{F#D19A66}%{T1}󰖂  $STATUS"
    else
        echo "%{F#98C379}%{T1}󰖂  $STATUS"
    fi
}

case "$1" in
    --toggle)
        shockvpn_toggle
    ;;
    *)
        shockvpn_status
    ;;
esac
