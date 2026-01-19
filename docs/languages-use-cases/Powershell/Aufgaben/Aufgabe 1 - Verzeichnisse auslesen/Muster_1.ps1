# Musterlösung Aufgabe 1

# 1.) Wechsle in den Ordner "C:\temp\schulung\aufgabe_1
Set-Location "C:\temp\schulung\aufgabe_1"

# 2.) Liste alle Dateien in diesem Ordner und in allen Unterordnern auf.
Get-ChildItem -Recurse -File |
    Select-Object -ExpandProperty Name

# 3.) Zähle, wie viele Datein (keine Ordner) insgesamt vorhanden sind.
(Get-ChildItem -Recurse -File).Count

# 4.) Zähle, wie viele Textdateien (.txt) insgesamt vorhanden sind.
(Get-ChildItem -Recurse -File -Filter *.txt).Count
