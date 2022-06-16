#!/bin/bash
# Erstellen Sie das Startskript für das Starten und Stoppen einer Anwendung (z.B. MySQL, MongoDB).
# bottom line you just have to check if your $1 is start, stop or reload
# if start you run the program in forking mode, write the pid to a pidfile and quit
# if stop or reload you get the pid from the pidfile and send SIGTERM or SIGHUP to it
# run the daemon as its own user

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
