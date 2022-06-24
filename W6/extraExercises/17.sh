#!/bin/bash

# Random%100 verwenden um eine Zufallszahl zwischen 0 und 100 zu erzeugen.
# logger wird aufgerufen und die Zufallszahl als Parameter übergeben.
# Die Zufallszahl wird in einem User-Info-Log-File gespeichert.
echo $((RANDOM%100)) | logger -p user.info
