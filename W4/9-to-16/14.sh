#!/bin/bash
# Schreiben Sie ein Shell-Skript, das alle Dateien im aktuellen Verzeichnis, die auf ".jpg" enden,
# so umbenennt, dass sie mit dem heutigen Datum im folgenden Format beginnen: JJJJ-MM-TT.
# Wenn sich zum Beispiel ein Bild meiner Katze im aktuellen Verzeichnis befindet und heute der 31. Oktober 2016 ist,
# würde es den Namen von "mycat.jpg" in "2016-10-31-mycat.jpg" ändern.
#
# Hinweis:
# Sie sollten das Skript ausführen, indem Sie das Skript in das Terminal eingeben.

# Alle Dateien im Verzeichnis auslesen
for file in *
  do
    # Dateiendung auslesen]
    extension=${file##*.}
    if [ $extension == "jpg" ]; then
        mv "$file" "$(date +%Y-%m-%d)"-"$file"
    fi
  done
