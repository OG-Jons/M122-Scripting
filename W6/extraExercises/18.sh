#!/bin/bash

# Die Funktion logging erstellt
# Die beigegebene Zufallsnummer anzeigen
# Mithilfe dem Logger die Nachricht einspeichern
# logger -i gibt zusätzlich die PID des Prozesses an
# RANDOM%100 erzeugt eine Zufallszahl zwischen 0 und 100

function logging() {
  msg="Zufallsnummer ist: $1"
  echo "$msg"
  logger -i -p user.info "$msg"
}

logging $((RANDOM%100))
logging $((RANDOM%100))
logging $((RANDOM%100))
