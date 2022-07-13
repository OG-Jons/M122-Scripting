#!/bin/bash
##

operationType="$1"
processToStart="$2"

if [ "$operationType" == "start" ]; then
  echo "Starting $processToStart"
  $processToStart &
  echo $! > "/run/user/$UID/$processToStart.pid"
  exit 0
elif [ "$operationType" == "stop" ]; then
  echo "Stopping $processToStart"
  pid=$(cat "/run/user/$UID/$processToStart.pid")
  kill "$pid"
  exit 0
elif [ "$operationType" == "reload" ]; then
  echo "Reloading $processToStart"
  pid=$(cat "/run/user/$UID/$processToStart.pid")
  kill -HUP "$pid"
  exit 0
else
  echo "Usage: $0 {start|stop|reload}"
  exit 1
fi
