#!/bin/bash -x
# -x ist ein Bash-Flag, das Bash dazu zwingt, eine mehr ausführliche Ausgabe zu erhalten.

# /home wird funktionieren
# /root wird nicht funktionieren, bricht heir jedoch nicht ab
# /dev wird funktionieren

ls /home
ls /root
ls /dev
