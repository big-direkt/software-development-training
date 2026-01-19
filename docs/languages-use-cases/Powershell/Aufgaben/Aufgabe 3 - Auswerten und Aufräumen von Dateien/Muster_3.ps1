# Musterlösung Aufgabe 3

Set-Location "C:\temp\schulung\aufgabe_3"

# 2) Alle Dateien auflisten (nur Namen)
Get-ChildItem -Recurse -File |
  Select-Object -ExpandProperty Name

# 3) Leere Ordner nach "leer" verschieben
Get-ChildItem ".\daten" -Recurse -Directory |
  Where-Object { (Get-ChildItem $_.FullName).Count -eq 0 } |
  Move-Item -Destination ".\leer"

# 4) Dateien älter als 1 Jahre nach "archiv" verschieben
$limit = (Get-Date).AddYears((-1))

Get-ChildItem ".\daten" -Recurse -File |
  Where-Object { $_.LastWriteTime -lt $limit } |
  Move-Item -Destination ".\archiv"

# 5a) Anzahl Ordner in "leer"
(Get-ChildItem ".\leer" -Directory).Count

# 5b) Anzahl Dateien in "archiv"
(Get-ChildItem ".\archiv" -File).Count
