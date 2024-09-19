#!/bin/bash

choice=$1
log_file=$2

case $choice in
    clearLogFile)
        cat /dev/null > "$log_file"
        ;;
    deleteLogFile)
        rm "$log_file"
        ;;
    elevatePriority)
        pid=$(ps -eo pid,cmd | grep "$log_file" | grep -v grep | awk '{print $1}')
        renice -n -5 -p "$pid"
        ;;
    *)
        echo "Invalid choice"
    ;;
esac