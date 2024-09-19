#!/bin/bash

choice=$1
option=$2
alias_name=$3

case $choice in
  -o)
    case $option in
      register)
        script_path=$4
        alias_name=$6

        
        service_file="/etc/systemd/system/${alias_name}.service"
        echo "[Unit]" > "$service_file"
        echo "Description=Daemon for $alias_name" >> "$service_file"
        echo "" >> "$service_file"
        echo "[Service]" >> "$service_file"
        echo "ExecStart=$script_path" >> "$service_file"
        echo "Restart=always" >> "$service_file"
        echo "" >> "$service_file"
        echo "[Install]" >> "$service_file"
        echo "WantedBy=multi-user.target" >> "$service_file"

      
        systemctl daemon-reload

        systemctl enable "$alias_name"
        systemctl start "$alias_name"

        echo "Service $alias_name registered and started."
        ;;
      start)
        service_name="${alias_name}.service"

        systemctl start "$service_name"

        echo "Service $alias_name started."
        ;;
      status)
        service_name="${alias_name}.service"

        systemctl status "$service_name" --no-pager

        ;;
      kill)
        service_name="${alias_name}.service"

        systemctl stop "$service_name"

        echo "Service $alias_name stopped."
        ;;
    esac
    ;;
    list)
        for service_file in /etc/systemd/system/*.service; do
          service_name=$(basename "$service_file" .service)
          echo "$service_name"
        done
        ;;
  *)
    echo "Invalid command."
    ;;
esac
