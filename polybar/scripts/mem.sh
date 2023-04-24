#!/bin/sh

mem() {
    # Get all info
    read -r -a mem_info <<< "$(free -m | awk '/^Mem:/ { print $2,$3,$4,$5,$6,$7 }')"

    # Assign mem info to proper vars
    mem_total=$(echo "scale=1; ${mem_info[0]}/1024" | bc)
    mem_used=$(echo "scale=1; ${mem_info[1]}/1024" | bc)
    mem_free=$(echo "scale=1; ${mem_info[2]}/1024" | bc)
    mem_shared=$(echo "scale=1; ${mem_info[3]}/1024" | bc)
    mem_cache=$(echo "scale=1; ${mem_info[4]}/1024" | bc)
    mem_avail=$(echo "scale=1; ${mem_info[5]}/1024" | bc)

    # Format numbers with leading zero when necessary
    if [[ "$mem_total" == "."* ]]; then mem_total="0$mem_total"; fi
    if [[ "$mem_used" == "."* ]]; then mem_used="0$mem_used"; fi
    if [[ "$mem_free" == "."* ]]; then mem_free="0$mem_free"; fi
    if [[ "$mem_shared" == "."* ]]; then mem_shared="0$mem_shared"; fi
    if [[ "$mem_cache" == "."* ]]; then mem_cache="0$mem_cache"; fi
    if [[ "$mem_avail" == "."* ]]; then mem_avail="0$mem_avail"; fi

    used_percent=$(echo "scale=2; $mem_used / $mem_total * 100" | bc | cut -d. -f1)
    avail_percent=$(echo "scale=2; $mem_avail / $mem_total * 100" | bc | cut -d. -f1)
    cached_percent=$(echo "scale=2; $mem_cache / $mem_total * 100" | bc | cut -d. -f1)
    free_percent=$(echo "scale=2; $mem_free / $mem_total * 100" | bc | cut -d. -f1)

    echo "U $used_percent% | A $avail_percent% | C $cached_percent% | F $free_percent%"
}

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

if [ $# -gt 0 ] && [ "$1" == "-swap" ]; then
    swap
else
    mem
fi
