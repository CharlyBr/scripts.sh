#!/bin/bash

if [ -z "$1" ]; then
	echo "Error: no process name supplied."
	echo
	echo "Example: ./process-uptime.sh <process_name>"
	echo
	exit 1
fi

PROCESS_PID=$(pidof $1)
if [ -z "${PROCESS_PID}" ]; then
	echo "Error: process not found <$1>"
	echo
	exit 1
fi

NB_SECS=$(ps -o etimes -p ${PROCESS_PID} --no-headers)

eval "echo $(date -ud "@${NB_SECS}" +'$((%s/3600/24)) days %H hours %M minutes %S seconds')"
