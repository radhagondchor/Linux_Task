#!/bin/bash

choice=$1
line=$2
innerchoice=$3
process=$4

case $choice in
  topProcess)
    case $innerchoice in
      memory)
        ps aux --sort=-%mem | head -n $(($line + 1))
        ;;
      cpu)
        ps aux --sort=-%cpu | head -n $(($line + 1))
        ;;
      *)
        echo "Invalid option for topProcess. Use 'memory' or 'cpu'."
        ;;
    esac
    ;;
  killLeastPriorityProcess)
    ps -eo pid,pri --sort=+pri | sed -n '2p' | awk '{print $1}' | xargs kill -9
    echo "Process with the least priority has been killed."
    ;;
  RunningDurationProcess)
    if [[ $process =~ ^[0-9]+$ ]]; then
      ps -p "$process" -o etime=
    else
      pid=$(pgrep "$process")
      if [ -n "$pid" ]; then
        ps -p "$pid" -o etime=
      else
        echo "Process '$process' not found."
      fi
    fi
    ;;

    listOrphanProcess)
    	ps -e -o pid,ppid,cmd | awk '$2 == 1' | grep -v PID
    ;;

    listZoombieProcess)
    ps aux | awk '$8 == "Z" { print $2, $11 }'
    ;;

     killProcess)
    	case $process in
      		*[!0-9]*)
        	pkill "$process"
        	echo "Process with name '$process' has been killed."
        ;;
      *)
        	kill -9 "$process"
        	echo "Process with PID '$process' has been killed."
        ;;
    esac
    ;;
    ListWaitingProcess)
    	ps -eo pid,stat,cmd | awk '$2 ~ /^[DR]/'
    ;;
  *)
    echo "Invalid command."
    ;;
esac



