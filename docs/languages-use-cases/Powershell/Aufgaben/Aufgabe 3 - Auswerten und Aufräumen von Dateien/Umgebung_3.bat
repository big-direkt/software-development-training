@echo off
set "BASE=C:\temp"
set "ROOT=%BASE%\schulung\aufgabe_3"

mkdir "%ROOT%"
mkdir "%ROOT%\daten"
mkdir "%ROOT%\daten\a"
mkdir "%ROOT%\daten\b"
mkdir "%ROOT%\daten\c"

mkdir "%ROOT%\archiv"
mkdir "%ROOT%\leer"

type nul > "%ROOT%\daten\a\a1.txt"
type nul > "%ROOT%\daten\a\a2.txt"
type nul > "%ROOT%\daten\a\a3.txt"

type nul > "%ROOT%\daten\b\b1.docx"
type nul > "%ROOT%\daten\b\b2.docx"
type nul > "%ROOT%\daten\b\b3.docx"

type nul > "%ROOT%\daten\c\c1.txt"
type nul > "%ROOT%\daten\c\c2.docx"

mkdir "%ROOT%\daten\leer1"
mkdir "%ROOT%\daten\leer2"

powershell -Command ^
"(Get-ChildItem '%ROOT%\daten' -Recurse -File).ForEach({ $_.LastWriteTime = '2025-01-01' })"

powershell -Command ^
"(Get-Item '%ROOT%\daten\a\a3.txt').LastWriteTime = Get-Date"
