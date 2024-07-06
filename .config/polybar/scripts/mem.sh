#!/usr/bin/env bash

swap() {
    # Get all info
    read -r -a mem_info <<< "$(free -m | awk '/^Swap:/ { print $2,$3,$4 }' | tr '\n' ' ')"

    # Assign swap info to proper vars
    swap_total=$(echo "scale=1; ${mem_info[0]}/1024" | bc)
    swap_used=$(echo "scale=1; ${mem_info[1]}/1024" | bc)
    swap_free=$(echo "scale=1; ${mem_info[2]}/1024" | bc)

    # Format numbers with leading zero when necessary
    if [[ "$swap_total" == "."* ]]; then swap_total="0$swap_total"; fi
    if [[ "$swap_used" == "."* ]]; then swap_used="0$swap_used"; fi
    if [[ "$swap_free" == "."* ]]; then swap_free="0$swap_free"; fi

    # Swap percentages
    swap_used_percent=$(echo "scale=2; $swap_used / $swap_total * 100" | bc | cut -d. -f1)
    swap_free_percent=$(echo "scale=2; $swap_free / $swap_total * 100" | bc | cut -d. -f1)

    echo "U $swap_used_percent% | F $swap_free_percent%"
}

mem_new() {
    # Strip Gi from 
    read -r -a mem_info <<< "$(free -hm | awk '/^Mem:/ { print $2,$3,$7 }' | tr -d 'Gi')"

    mem_total="${mem_info[0]}"
    mem_free="${mem_info[1]}"
    mem_avail="${mem_info[2]}"

    # If mem free is in Mb
    if  grep -q "M" <<< "$mem_free" ; then
        mem_free=$(echo "scale=2; $mem_free / 1024" | bc | cut -d. -f1)
    fi

    echo "Total ${mem_total}G | ${mem_avail}G | $(echo "scale=2; $mem_free / $mem_total * 100" | bc | cut -d. -f1)%"
}

if [ $# -gt 0 ] && [ "$1" == "-swap" ]; then
    swap
else
    mem_new
fi
