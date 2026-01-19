# Musterlösung Aufgabe 2

# 1) Wechsle in den Ordner
Set-Location "C:\temp\schulung\aufgabe_2"

# Basisordner explizit sammeln
$sourceFolders = Get-ChildItem -Directory -Name "ordner*"

# 2) Alle Dateien in ordner1..ordner10 inkl. Unterordner (nur Namen)
Get-ChildItem $sourceFolders -Recurse -File |
    Select-Object -ExpandProperty Name

# 3) Alle .txt nach ziel1 verschieben
Get-ChildItem $sourceFolders -Recurse -File -Filter *.txt |
    Move-Item -Destination "ziel1"

# 4) Alle .docx nach ziel2 verschieben
Get-ChildItem $sourceFolders -Recurse -File -Filter *.docx |
    Move-Item -Destination "ziel2"

# 5) Dateien in ziel1 zählen
(Get-ChildItem "ziel1" -File).Count

# 6) Dateien in ziel2 zählen
(Get-ChildItem "ziel2" -File).Count

# 7) ziel1 und ziel2 inkl. Inhalt nach "alle" kopieren
Copy-Item "ziel1" -Destination "alle" -Recurse -Force
Copy-Item "ziel2" -Destination "alle" -Recurse -Force
