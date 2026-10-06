#!/bin/bash

figlet ipechoCheck

KILL_SWITCH=false
INTERVAL=0

while [[ $# -gt 0 ]]; do
    case $1 in
        -k|--kill-switch)
            KILL_SWITCH=true
            shift
            ;;
        *)
            if [[ $1 =~ ^[0-9]+$ ]]; then
                INTERVAL=$1
            fi
            shift
            ;;
    esac
done

IP_FILE="/tmp/ipecho_initial_ip_$$"

cleanup() {
    rm -f "$IP_FILE"
}
trap cleanup EXIT

get_ip() {
    curl -s https://ipecho.net/plain
}

log() {
    local data=$(date +"%d/%m/%y %T - ")
    echo "$data$1" >> logIp.log
}

initial_ip=$(get_ip)
echo "$initial_ip" > "$IP_FILE"
log "Initial IP recorded: $initial_ip"

if [[ $INTERVAL -gt 0 ]]; then
    while true; do
        sleep "${INTERVAL}s"
        current_ip=$(get_ip)
        data=$(date +"%d/%m/%y %T ")
        echo "IP: $current_ip - $data"
        if [[ "$current_ip" != "$initial_ip" ]]; then
            log "IP CHANGED! Initial: $initial_ip Current: $current_ip"
            echo "IP CHANGED! Initial: $initial_ip Current: $current_ip"
            if [[ "$KILL_SWITCH" == true ]]; then
                log "KILL SWITCH ACTIVATED - Stopping NetworkManager"
                systemctl stop NetworkManager
                exit 1
            fi
        fi
        
        log "$current_ip"
    done
else
    echo "$initial_ip"
fi
