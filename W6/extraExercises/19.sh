#!/bin/bash -ex

# -ex ist ein Bash-Flag, das die Ausführungszeiten auf Fehler prüft und dann sofort abbricht falls ein Fehler vorkommt.

# /home wird funktionieren
# /root wird nicht funktionieren, das Skript bricht hier ab.
# /dev wird funktionieren, jedoch nicht ausgeführt

ls /home
ls /root
ls /dev
