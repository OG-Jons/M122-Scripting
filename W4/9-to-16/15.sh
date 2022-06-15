#!/bin/bash
# Schreiben Sie ein Skript, das Dateien anhand der Dateierweiterung umbenennt.
# Als nächstes sollte es den Benutzer fragen, welches Präfix dem Dateinamen vorangestellt werden soll.
# Standardmäßig sollte das Präfix das aktuelle Datum im Format JJJJ-MM-TT sein.
# Wenn der Benutzer einfach die Eingabetaste drückt, wird das aktuelle Datum verwendet.
# Andernfalls wird das vom Benutzer eingegebene Datum als Präfix verwendet.
# Als nächstes sollten der ursprüngliche Dateiname und der neue Name der Datei angezeigt werden.
# Schließlich sollte die Datei umbenannt werden.

# Regex der für die Struktur JJJJ-MM-TT zuständig ist
REGEX_DATE="^[0-9]{4}-[0-9]{2}-[0-9]{2}$"

echo "Bitte geben Sie ein Präfix ein (Standardmäßig das heutige Datum):"

read -r prefix

if [[ -z $prefix ]]; then
  prefix=$(date +%Y-%m-%d)
fi

echo "Geben sie die Dateierweiterung ein (Standardmäßig \"jpg\"):"

read -r suffix

if [[ -z $suffix ]]; then
  suffix="jpg"
fi

for file in *."$suffix"; do
  echo "Alter name: $file"
  echo "Neuer Name: $prefix-$file"
  mv "$file" "$prefix-$file"
done
