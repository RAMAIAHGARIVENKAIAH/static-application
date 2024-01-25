#!/bin/bash

get_system_info() {
    local date_time=$(date)
    local memory_percentage=$(free -m | awk '/Mem:/ {printf "%.2f", $3/$2*100}')
    local memory=$(free -m)
    local cpu_percentage=$(top -bn1 | awk '/%Cpu/ {printf "%.2f", 100 - $8}')
    local cpu=$(lscpu)
    local disk_percentage=$(df -h / | awk '/\// {printf "%s", $5}')
    local disk=$(df -h)

    echo "CPU Information:
    $cpu_percentage
    $cpu

    Memory Information:
    $memory_percentage
    $memory

    Date and Time:
    $date_time

    Disk Space:
    $disk_percentage
    $disk"
}

# Simple HTTP server to respond to requests with system information
while true; do
    (echo -ne "HTTP/1.1 200 OK\n\n$(get_system_info)") | nc -l -p 80 -q 1 > /dev/null
done
