#!/usr/bin/env bash

SLEEP_TIME=60
MAX_TRIES=5
SITE="monitor"

tries=0
echo "** Starting OMD **"
omd start $SITE
while /bin/true; do
  sleep $SLEEP_TIME
  omd status $SITE | grep -q "stopped" && {
    if [ $tries -gt $MAX_TRIES ]; then
      echo "** ERROR: Stopped service found; aborting (after $tries tries) **"
      exit 1
    fi
    tries=$(( tries + 1 ))
    echo "** ERROR: Stopped service found; trying to start again **"
    omd start $SITE
  }
done

