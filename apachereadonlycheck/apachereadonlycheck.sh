#!/bin/bash

RUNNING="`service apache2 status | grep "Apache is running" | wc -l`"

if [ "${RUNNING}" -eq "0" ]; then
    mount -o remount /
    # remount first so you can write logs
    echo "[`date`] Apache not running, remounting and restarting."
    service apache2 start
else
    echo "[`date`] Apache running"
fi
