#!/bin/bash

STATUS=$(echo $(openvpn3 sessions-list | grep Status | cut -d ':' -f 2 | awk '{$1=$1};1'))
SESSION_PATH=$(echo $(openvpn3 sessions-list | grep Path | cut -d ':' -f2 |  awk '{$1=$1};1'))

openvpn_disconnect() {
    openvpn3 session-manage --session-path $SESSION_PATH --disconnect > /dev/null 2>&1
}

openvpn_toggle() {
    if [ "$STATUS" != '' ]; then
        openvpn_disconnect
    else
        openvpn_connect
    fi
}

openvpn_connect() {
    TWOFA=$(rofi -demnu -dmenu -p "2FA Code: ")

    if [ "$TWOFA" == '' ]; then
        exit 1
    fi

    printf "$TWOFA\n" | openvpn3 session-start --config ~/Documents/Travefy/1687874122977.ovpn
}

openvpn_status() {
    if [ "$STATUS" == '' ]; then
        echo "%{F#E06C75}%{T1}󰖂  Not connected [Travefy]"
    elif [ "$STATUS" == 'Connection, Client connected' ]; then
        echo "%{F#98C379}%{T1}󰖂  Travefy"
    else
        echo "%{F#D19A66}%{T1}󰖂  $STATUS [Travefy]"
    fi
}

case "$1" in
    --toggle)
        openvpn_toggle
    ;;
    *)
        openvpn_status
    ;;
esac
