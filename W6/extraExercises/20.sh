#!/bin/bash -x
# -x ist ein Bash-Flag, das Bash dazu zwingt, eine mehr ausführliche Ausgabe zu erhalten.

ls /home # wird funktionieren
ls /root # wird nicht funktionieren, bricht heir jedoch nicht ab
ls /dev # wird funktionieren
