## Software Ecosystem (Software Ökosystem)

### 1. 💡 Was ist ein Software Ecosystem? - Kontext

> [!NOTE]
> Allgemein:<br>Ist ein Verbund aus Softwarekomponenten, Akteuren und Organisationen, welche über gemeinsame technische Plattformen, Schnittstellen und Geschäftsmodelle miteinander interagieren und sich gemeinsam weiterentwickeln.

> [!IMPORTANT]
> Im Kontext von Administration und Systemintegration (A&S):<br>
> Ein Verbund aus Betriebssystemen, Plattformen, Anwendungen, Cloud-Services, Schnittstellen und Herstellern, die gemeinsam einen stabilen IT-Betrieb ermöglichen müssen.

> [!TIP]
> Ziel (im Kontext von A&S):<br>
> Das Ecosystem stabil, sicher und wartbar zu betreiben und weiterzuentwickeln.

<br>

#### Beispiel 1: Microsoft Ecosystem

- Bestandteile:
  - Windows Server, Active Directory, Azure AD
  - Microsoft 365, Exchange, Intune
  - Drittsoftware (Backup, Antivirus, ERP)
- Admin-Aufgaben:
  - Identitäten & Rechte über mehrere Systeme synchronisieren
  - Hybrid-Betrieb (On-Prem + Cloud)
  - Updates & Kompatibilität sicherstellen
- Kontext: Abhängigkeiten zwischen Microsoft-Diensten

<br>

#### Beispiel 2: Linux / Open-Source Ecosystem

- Bestandteile:
  - Linux-Distributionen
  - Apache, Nginx, Docker, Kubernetes
  - Open-Source-Libraries
- Admin-Aufgaben:
  - Paketmanagement & Versionierung
  - Auswahl stabiler Komponenten
  - Umgang mit Community-Support
- Kontext: Nachhaltigkeit & Security im OSS-Ecosystem

<br>

#### Beispiel 3: Virtualisierungs- & Container-Ecosystem

- Bestandteile:
  - VMware / Hyper-V
  - Docker, Kubernetes
  - Monitoring- & Backup-Tools
- Admin-Aufgaben:
  - Kompatibilität zwischen Host, VM, Container
  - Automatisierung & Orchestrierung
  - Performance- und Ressourcenmanagement
- Kontext: Koexistenz mehrerer Plattformen

<br>

#### Beispiel 4: Cloud Ecosystem (AWS/Azure)

- Bestandteile:
  - Compute, Storage, Netzwerk
  - Identity, Security, Monitoring
  - Drittanbieter-Services
- Admin-Aufgaben:
  - Integration von Cloud-Services
  - Kostenkontrolle (FinOps)
  - Sicherheit über mehrere Anbieter
- Kontext: Vendor Lock-in & Multi-Cloud

<br>

#### Beispiel 5: Security Ecosystem

- Bestandteile:
  - Firewalls, SIEM, Endpoint Protection
  - Identity Provider, MFA
  - Cloud-Security-Tools
- Admin-Aufgaben:
  - Security-Tools integrieren
  - Log-Korrelation
  - Incident Response über mehrere Systeme
- Kontext: Sicherheitsketten statt Einzelprodukte

<br>

### 2. 🚀 Konkrete Aufgaben im Software Ecosystem

| Aufgabe                  | Bezug zum Ecosystem                    |
| ---:                     | ---                                    |
| Software auswählen       | Abhängigkeiten & Hersteller bewerten   |
| Systeme integrieren      | APIs, Schnittstellen, Protokolle       |
| Updates planen           | Auswirkungen auf andere Systeme        |
| Störungen beheben        | Fehler über Systemgrenzen hinweg       |
| Sicherheit gewährleisten | Schwachstellen in Drittsoftware        |
| Dokumentation            | Überblick über komplexe Abhängigkeiten |

<br>

### 3. ⚠️ Mögliche Problemstellungen im Kontext Admins/Systemintegration

- Update eines Systems bricht Integration mit anderen
- Cloud-Dienst ändert API oder Lizenzmodell
- Sicherheitslücke in Drittkomponente
- Hersteller stellt Support ein
- Unterschiedliche Release-Zyklen kollidieren

==> Hier ist Wissenaustausch (Verständnis) essenziell

<br>

### 4. 📚 Themen zum Stöbern

#### GitHub/GitLab (Plattformen & Kollaboration)

> Zentral für Teamarbeit.

- Versionsverwaltung (Commit, Branch, Merge, Rebase)
- Pull/Merge Requests, Code Reviews, Issues, Boards
- CI/CD-Pipelines (Basics), Runner, Artefakte
- Zugriffssteuerung, Webhooks, Pages

#### Framework-Dokumentationen & Referenzen

> Wie man Wissen findet.

- Offizielle Docs, API-Referenzen, Getting Started
- [Release Notes](https://developer.chrome.com/release-notes), [Changelog](https://github.com/sven-seyfert/autoit-webdriver-boilerplate/blob/main/CHANGELOG.md), Semantic Versioning
- Community-Ressourcen (Stack Overflow, RFCs)
- Effektives Suchen & Lesen von Beispielen

#### APIs/Schnittstellen

> Interaktion zwischen Systemen.

- REST, GraphQL, gRPC
- Authentifizierung (API-Key, OAuth2, JWT)
- [OpenAPI (Swagger)](https://petstore.swagger.io/?_gl=1*nfvysa*_gcl_au*MTQ0OTU0MTExNi4xNzY4NTY4MTI5), Postman
- Versionierung & Backward Compatibility

#### Laufzeitumgebungen & Paketmanagement

> Ausführen & Abhängigkeiten.

- [Node.js (npm, modules)](https://www.ionos.de/digitalguide/websites/web-entwicklung/einfuehrung-in-nodejs/#content-modulstruktur-und-npm), .NET CLR, JVM (OpenJDK)
- Paketmanager & Versionsmanager
- Containerisierung (Docker) & Deployment-Grundlagen

#### Lizenzen & Compliance (Open Source != Free)

> Rechtliche Grenzen beim Verwenden von Komponenten.

- [Grundtypen](https://choosealicense.com/licenses/): Permissive (MIT, Apache 2.0) vs Copyleft (GPL)
- Pflichten, kommerzielle Nutzung
- Lizenzkompatibilität, Abhängigkeiten prüfen

#### Sicherheit & Secrets Management

> Risiken erkennen, bewerten, Eintrittswahrscheinlichkeit reduzieren.

- keine Secrets in Repos
- Einsatz von Secrets Management der Plattformen
- oder Einsatz von Vaults
- Breaking changes in Software und Services (Updates mit Vorsicht)

#### Observability

> Nachhaltigkeit und Analyse.

- Logging, Monitoring, Alerting
  - Grafana, Prometheus, ELK Stack
- Metriken aufstellen, aber dem Ecosystem Kontext angepasst
  - Verfügbarkeitsmetriken
  - Performance-Metriken
- Tracing über Systemgrenzen hinweg

#### Dependency Management

> Abhängigkeiten verstehen.

- Package-Ecosystem
- Supply-chain risk
- [SBOM](https://about.gitlab.com/de-de/blog/the-ultimate-guide-to-sboms/#was-ist-eine-software-bill-of-materials) (Software Bill of Materials)

#### Testing & Quality

> Sicherheit gewinnen.

- Unit, Integration
- Linters, Static Analysis

<br>

### 5. 🤖 Einsatz von KI (LLMs)

> Werkzeuge, Chancen & Grenzen.

- Use Cases (Einsatzgebiete)
- Unterstützung bei Code, Tests, Doku
- Spezifikationsgetriebene Prompts [(Spec Driven Prompt Engineering)](https://www.augmentcode.com/guides/spec-driven-prompt-engineering-for-developers)
- Grenzen, Datenschutz, Lizenzfragen
- Assistierend und kein "Vibe Coding"
- [n8n](https://n8n.io)

> [!WARNING]
> Generell: Skeptische Haltung gegenüber KI um jeden Preis und überall, jedoch genügend Offenheit um die Entwicklung zu beobachten und ggf. zu adaptieren.

<br>

### 6. 🔍 Weitere Themen im Zusammenhang mit dem obigen

- CVEs (Common Vulnerabilities and Exposures) kennen
  - [BSI](https://wid.cert-bund.de/portal/wid/kurzinformationen) (Bundesamt für Sicherheit in der Informationstechnik)
  - [Bleeping Computer](https://www.bleepingcomputer.com/tag/vulnerability/)
- Infrastructure as Code ([Terraform](https://developer.hashicorp.com/terraform))
- Tool maintenance (community-driven vs. company backed)

<br>

### 7. 🛠️ Empfohlenes Tooling (lohnt sich zu kennen bzw. zu lernen)

| Kategorie | Tool |
| --- | --- |
| API Requests | [cURL](https://curl.se/docs/tutorial.html) |
| Changelog | [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) |
| Diagramme | [Mermaid](https://mermaid.js.org/syntax/sequenceDiagram.html#actor-creation-and-destruction-v10-3-0) |
| Dokumentation | [Markdown](https://www.markdownguide.org/getting-started/) |
| JSON | [jq](https://jqlang.org/tutorial/) |
| Recherche, coding support | KI ([Claude](https://code.claude.com/docs), [GitHub Copilot](https://github.com/features/copilot)) |
| Versionierung | [Semantic Versioning](https://semver.org/spec/v2.0.0.html) |

<br>

### 8. 🎬 Empfohlene Lernplattformen

- [Pluralsight](https://www.pluralsight.com)
  - Hochwertige Tutorials
  - von zertifizierten Experten
- [Udemy](https://www.udemy.com)
  - auch gut
  - eher weniger zertifizierte Experten
