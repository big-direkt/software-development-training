## 1. Was ist Versionskontrolle

- Definition: Versionskontrolle (VCS) ist ein System, das Änderungen an Dateien (meist Code) über die Zeit speichert und verwaltet.
- Kernbegriffe: Repository (Projektablage), Commit (Speichern einer Änderung), Branch (Nebenlinie/Zweig für Entwicklung), Merge (Zusammenführen).
- Zusammenarbeit: Entwickler teilen Änderungen über Remote-Repositories (push/pull), lösen Konflikte und prüfen Änderungen.
- Beispiele: Beliebte Systeme sind Git, Subversion (SVN) und Mercurial — Git ist heute am weitesten verbreitet.

<br>

## 2. Warum ist Versionskontrolle hilfreich

- Möglichkeit Änderungen rückgängig zu machen
- Historie (wer hat was wann geändert)
- Zusammenarbeit: parallele Arbeit dank Branches
- Nachvollziehbarkeit: Code Reviews & Pull Requests (PRs)
- Experimentieren ohne Risiko (dank Branches, Tags, Releases)
- Reproduzierbarkeit (checke konkreten Zwischenstand aus und teste)

<br>

## 3. Git, GitHub und Co.

#### 3.1 Git != GitHub

- Git = verteiltes Versionskontrollsystem (lokales Tool)
- GitHub, GitLab oder Codeberg = Hosting-Plattformen + Web-UI
  - Zusatzfunktionen (Issues, PRs/MRs (Merge Requests), Actions, Wikis, bearbeiten in Web-UI-Editor)
  - Plattformen bieten Kollaboration, Sichtbarkeit, Berechtigungen, CI/CD, Web-Review-UI.

#### 3.2 Wie funktioniert Git

- [einfaches Schaubild](./git-idea.md)
- [Git general Cheat-Sheet](https://bytebytego.com/guides/git-commands-cheat-sheet/)

<br>

## 4. Praxis: Git installieren, git config

#### 4.1 Git selbst

- Git installieren
- VSCode installieren

``` bash
# Ist Git installiert?
git --version

# Setze einmalig globale Konfiguration.
git config --global user.name "Vorname Nachname"
git config --global user.email "me@beispiel.de"
git config --global init.defaultbranch main

# Zeige globale Konfiguration an.
git config --global --list
```

#### 4.2 VSCode

- ⚙️ Settings setzen: `terminal.integrated.defaultProfile.windows` zu "Git Bash"
- 🧩 Extension installieren:
  - "Git History" (by Don Jayamanne)
  - "GitLens — Git supercharged" (by GitKraken)
  - "Markdown All in One" (by Yu Zhang)

<br>

## 5. Praxis: Git basics (lokal)

- [Git command Cheat-Sheet](https://cheatsheets.zip/git)

#### 5.1 Eigenes Repo erstellen

``` bash
mkdir git-tryout-sven
cd git-tryout-sven
git init
# Oder: git init --initial-branch=main
# wird aber nicht gebraucht, weil wir global den main branch
# als default definiert haben.
```

#### 5.2 PowerShell Code schreiben

``` powershell
# Lege PowerShell Skript mit Inhalt an.
New-Item -Path . -Name "beautiful-script.ps1" -ItemType "file" -Value "Write-Host 'Hi SDT folks'"
```

#### 5.3 Erster Commit

``` bash
# Aktuellen Git Status prüfen ==> eine Datei ist "untracked".
git status

# Diese Datei hinzufügen, zu Staging Area.
git add beautiful-script.ps1
# Oder: git add .
# um alle unstages Dateien hinzuzufügen.

# Commit mit Message
git commit -m "Added: Beautiful PowerShell script."
```

#### 5.4 Remote Repo auf GitHub anlegen

- Dies machen wir zusammen über die Web-UI.
- Im wesentlichen einfach den übersichtlichen Buttons der GitHub Web-UI folgen.
- Repository Namen `git-tryout-sven` vergeben (so wie der Ordner am Anfang (kein muss, nur Empfehlung)).

#### 5.5 Remote Repo mit lokal verbinden und pushen

``` bash
# verbinden
git remote add origin https://github.com/sven-seyfert/git-tryout-sven.git

# pushen
git push -u origin main
```

<br>

## 6. Praxis: Git- und GitHub basics (forks und branches)

#### 6.1 Vorhandenes Repo clonen (aus der GitHub Organisation)

Hinweis: Es muss keine GitHub Organisation sein. Einfach ein Repository was einem nicht gehört.

``` bash
# Nach dem Clone liegt das Repo. lokal im Ordner wo der Befehl abgesetzt wird.
# Daher ggf. den Ordner danach verschieben.
git clone https://github.com/big-direkt/software-development-training.git
```

#### 6.2 Versuch zu contributen (Änderungen ins Repo zu übertragen)

- Code schreiben (fizz-buzz.ps1) und pushen wiederholen (direkt auf main).
- Der push wird verweigert - branch rules (protected default branch) policy greift.
- Was also stattdessen tun 🤔 ?

#### 6.3 Fork erstellen

- Fork in GitHub Web-UI erstellen.
  - Damit ist das Ziel-Repo. im eigenen GitHub Bereich verfügbar.
- Dieses Repo wird dann ge'clone't (clone des Forks nach lokal).
- Sync (upstream) einrichten.

``` bash
# Sein geforktes Repo. referenzieren
# oder das des Original-Repos., welches wir vorher ge'clone't hatten, setzen.
git remote set-url origin https://github.com/sven-seyfert/software-development-training.git

# Upstream setzen, damit überhaupt ein Pull Request (PR) möglich sein kann.
git remote add upstream https://github.com/big-direkt/software-development-training.git
```

#### 6.4 Mit Branches arbeiten

[Git branches Cheat-Sheet](https://devhints.io/git-branch)

Nun muss, da auf den allermeisten Repositories eine branch policy liegt, die verhindert das man von "main" auf "main" push kann, über einen extra Zweig (branch) gegangen werden. Von diesem aus kann man dann den PR erstellen.

``` bash
# Create new branch.
git checkout -b add-fizz-buzz-example

# Arbeiten und dann:
git add .
git commit -m "Added: Awesome fizz-buzz example code."
git push -u origin add-fizz-buzz-example
```

#### 6.5 Pull Request (PR) auf GitHub erstellen

- Auf GitHub: Compare & pull request (Web-UI).
- Reviewer zuweisen (approval principle).
- Einfach der Nutzerführung auf GitHub folgen.

#### 6.6 Review und Merge

- Reviewer kommentiert (optional aber in der Praxis üblich).
- (Optional) fordert der Reviewer weitere Änderungen beim PR-Steller an.
  - Dieser pusht weitere commits auf denselben Branch (kein neuer PR nötig).
  - Dann wird erneut reviewed.
- Wenn alles gut, dann gibt der Reviewer sein okay, "approval".
- Danach folgt der Merge via Web-UI.

#### 6.7 Lokale Schritte nach dem Merge

- Lokal: nach Merge → git checkout main → git pull upstream main oder falls Fork: git fetch upstream && git merge upstream/main oder git rebase upstream/main.

``` bash
# Zurück auf main wechseln.
git checkout main

# Prüfen was potenziell geholt wird (welche Dateien und Änderungen).
git fetch --all --prune
git fetch upstream --prune

# Den aktualisierten Code-Stand von main holen (sync/pull).
git pull upstream main
# Oder: git pull origin main

# Lokalen branch löschen.
git branch -d add-fizz-buzz-example
```

<br>

## 7. Exkurs: Markdown

[Klicke hier](./markdown.md)

<br>

## 8. Praxis: Git Advanced (nur ausgewähltes)

#### 8.1 Branches anzeigen (lokal, remote)

``` bash
# Auflistung lokal
git branch

# Auflistung remote
git branch -r

# Auflistung all
git branch -a
```

#### 8.2 Stash

- git stash, git stash pop erläutern
  - siehe Cheat-Sheet und folgendes 🎬 [stash](https://www.youtube.com/watch?v=lH3ZkwbVp5E&t=23s) Video
- praktisches Beispiel zeigen

#### 8.3 git diff (git graph)

Dies kann via Terminal oder einfach in VSCode (besser) dargestellt werden.

#### 8.4 Commit Message ändern (bestehender Commit vor push)

Angenommen der Ursprungstext der Commit Message war "Changed: Color of login submit button to red.", ist aber falsch, denn der Button wurde grün, nicht rot. Dann:

``` bash
# ==> --amend
git commit --amend -m "Changed: Color of login submit button to green."
```

#### 8.5 Zu einem konkreten Commit-Stand (aus der History) zurück springen

Hier erstellen wir einen neuen Branch, der den Code-Stand des vorher ausgewählten Commit-Standes hat. Somit können wir einen alten Stand nochmal testen, nachvollziehen ohne das wir den aktuelleren Stand verlieren.
Im neuen Branch ist dann also alles "alt", kann aber mit `git checkout main` (also wechseln zwischen den Branches) wieder zu main zurückgesprungen werden.

``` bash
# Zu welchem Stand soll zurück gegangen werden?
# Commit hash kopieren.
git log

# Branch anlegen mit dem Stand des commit hashs.
# git checkout -b <branch-name> <commit-hash>
git checkout -b specific-commit-branch dcabfb9
```

#### 8.6 Optional 1

- Git TAGs und Releases: für GitHub allgemein sinnvoll und für automatisch generierte CHANGELOG.md Dateien ebenfalls praktisch.
- Beispiel: [eines meiner privaten Projekte](https://github.com/sven-seyfert/autoit-webdriver-boilerplate/blob/main/CHANGELOG.md)
- Hier spielt dann auch [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) und [Semantic Versioning](https://semver.org/spec/v2.0.0.html) eine große Rolle.

#### 8.7 Optional 2

Zu einem pull request commit weitere Commits hinzufügen, bevor der PR gemerged wird.

``` bash
# Get PR by pull request identifier (hier pr-1).
git fetch origin pull/1/head:pr-1
git checkout pr-1

# Commit changes.
git add .
git commit -m "Styled: Trival formatting change."

# Add remote fork (zum lokalen Repo).
git remote add kneofo git@github.com:kneofo/software-development-training.git

# Push back to PR.
git remote set-url kneofo https://github.com/kneofo/software-development-training.git
git push kneofo pr-1:patch-1

# Clean-up
git remote remove kneofo
git remote -v  # optional, dient nur zur Kontrolle
git branch -vv # optional, dient nur zur Kontrolle
git branch -D pr-1
```
