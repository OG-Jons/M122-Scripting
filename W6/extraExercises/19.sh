#!/bin/bash -ex

# -ex ist ein Bash-Flag, das die Ausführungszeiten auf Fehler prüft und dann sofort abbricht falls ein Fehler vorkommt.

ls /home # wird funktionieren
ls /root # wird nicht funktionieren, das Skript bricht hier ab.
ls /dev # wird funktionieren, jedoch nicht ausgeführt
