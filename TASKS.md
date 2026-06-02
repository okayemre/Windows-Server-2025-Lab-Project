

**ABSCHLUSSPROJEKT**

Windows Server 2025 – Kurs

 

**TechWork Solutions GmbH**

IT-Infrastruktur komplett aufbauen

| Bearbeitungszeit | 3–4 Unterrichtstage (Nachmittagsblöcke) |
| :---- | :---- |
| **Abgabe** | Dokumentation mit Screenshots \+ Live-Demo |
| **Voraussetzung** | Laufende Windows Server VM \+ Windows 11 Client |

# **1  Das Szenario**

| Du bist ab heute der IT-Administrator der TechWork Solutions GmbH – ein kleines aber wachsendes Beratungsunternehmen in Wien. Das Unternehmen hatte bisher keine geordnete IT-Infrastruktur. Alles lief über einen alten Einzelrechner und USB-Sticks. Der Chef hat entschieden: Es wird Zeit für eine echte Server-Umgebung. Dein Auftrag: Alles von Grund auf aufbauen – sauber, sicher, dokumentiert. |
| :---- |

## **Das Unternehmen**

| Firma | TechWork Solutions GmbH |
| :---- | :---- |
| Branche | IT-Beratung & Projektmanagement |
| Standort | Wien, Österreich |
| Mitarbeiter | 3 Personen \+ 1 IT-Admin (du) |
| Domänenname | techwork.local |
| Server-Computername | TW-DC01 |
| Client-Computername | TW-CLIENT01 |

## **Die drei Mitarbeiter**

| Benutzername | Abteilung / Rolle |
| :---- | :---- |
| m.huber (Maria Huber) | Geschäftsführung – braucht Zugriff auf alles |
| t.berger (Thomas Berger) | IT – Techniker, lokaler Admin |
| s.wagner (Sandra Wagner) | Buchhaltung – nur Lesezugriff auf Finanzen |

# **2  Voraussetzungen (Basis-Setup)**

| Das folgende Setup muss FERTIG und FUNKTIONSFÄHIG sein, bevor du mit den Aufgaben beginnst. Wenn dein Setup noch nicht so weit ist – baue es zuerst auf. |
| :---- |

## **Pflicht-Basis**

* **Windows Server 2025 VM läuft als Domänencontroller (DC) für techwork.local**

* AD DS, DNS, DHCP sind installiert und konfiguriert

* Statische IP: 192.168.100.10

* Server-Name: TW-DC01

* **Windows 11 Client VM ist der Domäne techwork.local beigetreten**

* Client-Name: TW-CLIENT01

* IP via DHCP aus dem Server-Bereich

* Anmeldung als Domänenbenutzer funktioniert

* **AD-Benutzer m.huber, t.berger, s.wagner existieren bereits im AD**

## **Empfohlene VM-Ressourcen für Zusatz-VMs (Cluster)**

| Für den Failover-Cluster (Aufgabe 13\) brauchst du 3 zusätzliche VMs: TW-CL1, TW-CL2 und TW-STOR1. Diese kannst du als 'stripped down' Server-VMs anlegen (Server Core reicht, oder Standard mit wenig RAM). Plane dafür extra Zeit ein. |  |
| :---- | :---- |
| **VM-Name** | **Aufgabe / Ressourcen** |
| TW-DC01 | DC, DNS, DHCP – Hauptserver (bereits vorhanden) |
| TW-CLIENT01 | Windows 11 Client (bereits vorhanden) |
| TW-CL1 | Cluster-Node 1 – min. 2 GB RAM, 2 vCPU |
| TW-CL2 | Cluster-Node 2 – min. 2 GB RAM, 2 vCPU |
| TW-STOR1 | Shared Storage – min. 1 GB RAM, 20 GB Disk |

# **3  Aufgaben**

| Achtung: Die Aufgaben bauen teilweise aufeinander auf. Lies jede Aufgabe vollständig durch, bevor du beginnst. Wenn eine Aufgabe nicht funktioniert – dokumentiere das Problem und mache mit der nächsten weiter. |
| :---- |

| A1 | Active Directory – Struktur und Benutzer Thema: AD, Gruppen, Berechtigungen |
| :---: | :---- |

Erstelle eine saubere AD-Struktur für TechWork Solutions. Das Unternehmen braucht Organisationseinheiten (OUs), Sicherheitsgruppen und korrekt zugeordnete Benutzer.

**Aufgabe:**

* Erstelle folgende OUs in Active Directory:

* TW-Mitarbeiter

* TW-Gruppen

* TW-Computer

* Erstelle folgende Sicherheitsgruppen (in OU TW-Gruppen):

* GG\_Geschaeftsfuehrung

* GG\_IT\_Admin

* GG\_Buchhaltung

* GG\_Alle\_Mitarbeiter

* Verschiebe die Benutzer in die OU TW-Mitarbeiter

* Weise die Benutzer den richtigen Gruppen zu:

* m.huber → GG\_Geschaeftsfuehrung \+ GG\_Alle\_Mitarbeiter

* t.berger → GG\_IT\_Admin \+ GG\_Alle\_Mitarbeiter

* s.wagner → GG\_Buchhaltung \+ GG\_Alle\_Mitarbeiter

| Screenshot-Pflicht: AD-Benutzer und Computer – OU-Struktur sichtbar, Benutzereigenschaften mit Gruppenm itgliedschaften. |
| :---- |

| A2 | NTFS & Freigabe-Berechtigungen Thema: Dateisystem, Freigaben, NTFS-Rechte |
| :---: | :---- |

Das Unternehmen braucht freigegebene Ordner mit unterschiedlichen Zugriffsrechten. Wichtig: Berechtigungen werden immer über Gruppen vergeben – nie direkt auf Benutzer.

**Aufgabe:**

* Erstelle auf dem Server ein neues Volume (z.B. D:\\) oder einen dedizierten Ordner D:\\Freigaben

* Erstelle folgende Ordner und fülle sie mit mindestens 2–3 Testdateien (.txt, .docx o.ä.):

* D:\\Freigaben\\Geschaeftsfuehrung

* D:\\Freigaben\\IT

* D:\\Freigaben\\Buchhaltung

* D:\\Freigaben\\Alle

* Gib alle Ordner als Netzwerkfreigaben frei

* Setze NTFS-Berechtigungen nach diesem Schema:

| Ordner | Gruppe / Berechtigung |
| :---- | :---- |
| Geschaeftsfuehrung | GG\_Geschaeftsfuehrung: Vollzugriff |
| IT | GG\_IT\_Admin: Vollzugriff |
| Buchhaltung | GG\_Buchhaltung: Ändern | GG\_Geschaeftsfuehrung: Lesen |
| Alle | GG\_Alle\_Mitarbeiter: Lesen & Ausführen |

* Teste vom Client aus: Melde dich als s.wagner an → prüfe ob Buchhaltung lesen und schreiben geht, Geschaeftsfuehrung aber nicht

| Screenshot-Pflicht: NTFS-Berechtigungen eines Ordners \+ Test vom Client (Zugriff erlaubt / verweigert). |
| :---- |

| A3 | Gruppenrichtlinie (GPO) – Hintergrundbild Thema: GPO, Computerkonfiguration |
| :---: | :---- |

Der Chef möchte, dass alle Firmen-Clients ein einheitliches Hintergrundbild mit dem Firmenlogo haben. Das wird über eine Gruppenrichtlinie gesteuert – damit muss niemand manuell an den Clients etwas einstellen.

**Aufgabe:**

* Erstelle eine neue GPO namens GPO-TW-Desktop

* Verknüpfe sie mit der OU TW-Computer

* Konfiguriere die GPO so, dass ein Hintergrundbild auf dem Windows 11 Client erzwungen wird:

* Speichere ein Bild (.jpg) auf dem Server in einem freigegebenen Pfad, z.B. \\\\TW-DC01\\Netlogon\\hintergrund.jpg

* Oder kopiere ein beliebiges Bild auf den Client und setze den Pfad in der GPO

* Pfad in der GPO: Benutzerkonfiguration → Administrative Vorlagen → Desktop → Desktop

* Erzwinge die GPO am Client: gpupdate /force

* Überprüfe: Ändert sich das Hintergrundbild auf dem Client?

| Screenshot-Pflicht: GPO-Einstellung im Editor \+ Hintergrundbild auf dem Windows 11 Client sichtbar. |
| :---- |

| A4 | RAID & Storage Spaces Thema: Speicherpools, Virtuelle Datenträger, Mirror |
| :---: | :---- |

Das Unternehmen braucht ausfallsichere Datenspeicherung. Du richtest einen Speicherpool mit Mirror-Konfiguration ein – wie eine RAID-1-Lösung, aber direkt in Windows Server.

**Aufgabe:**

* Füge dem Server 2 zusätzliche virtuelle Festplatten hinzu (je min. 10 GB) in VMware

* Erstelle in Server Manager unter Datei- und Speicherdienste → Speicherpools einen neuen Pool:

* Name: Pool-TW-Daten

* Beide neuen Festplatten in den Pool aufnehmen

* Erstelle einen virtuellen Datenträger auf dem Pool:

* Name: VDisk-Mirror

* Layout: Mirror (= Daten werden gespiegelt auf beide Disks)

* Erstelle ein neues Volume (E:\\) auf dem virtuellen Datenträger und formatiere es als NTFS 

| Screenshot-Pflicht: Server Manager mit Speicherpool und virtuellem Datenträger.  |
| :---- |

| A5 | BitLocker & EFS – Verschlüsselung Thema: Laufwerkverschlüsselung, Dateiverschlüsselung |
| :---: | :---- |

Vertrauliche Daten müssen verschlüsselt sein. Du verwendest BitLocker um ein ganzes Laufwerk zu sichern, und EFS um einzelne Dateien zusätzlich zu schützen.

**Aufgabe:**

* BitLocker: Füge dem Server eine weitere kleine virtuelle Disk (10 GB) hinzu und formatiere sie als NTFS-Volume (F:\\)

* Aktiviere BitLocker auf diesem Volume F:\\:

* Passwort als Entsperrmethode

* Wiederherstellungsschlüssel speichern (Textdatei o.ä.)

* Laufwerk verschlüsseln

* Lege eine Testdatei bitlocker-test.txt auf F:\\ ab

* EFS: Erstelle eine Testdatei efs-vertraulich.txt auf einem normalen NTFS-Laufwerk (z.B. D:\\)

* Verschlüssele die Datei mit EFS:

* Rechtsklick → Eigenschaften → Erweitert → 'Inhalt verschlüsseln' aktivieren

* Überprüfe: Die Datei erscheint im Explorer mit grüner Schrift

| Screenshot-Pflicht: BitLocker-Status des Laufwerks F:\\ (verschlüsselt) \+ EFS-Datei im Explorer (grüner Schriftzug). |
| :---- |

| A6 | Datendeduplizierung Thema: Data Deduplication, Speicheroptimierung |
| :---: | :---- |

Auf einem Datenspeicher-Volume wird Datendeduplizierung aktiviert – damit werden doppelt gespeicherte Dateien erkannt und Speicherplatz gespart.

**Aufgabe:**

* Nutze das Volume E:\\ (aus Aufgabe 4, Speicherpool) oder ein eigenes NTFS-Volume

* Installiere das Feature Datendeduplizierung 

* Aktiviere Deduplizierung auf dem Volume:

* Server Manager → Datei- und Speicherdienste → Volumes → Rechtsklick → Deduplizierung konfigurieren

* Nutzungstyp: Dateiserver

* Kopiere mindestens 5 identische Textdateien auf das Volume (um Deduplizierung zu testen)

* Führe manuell einen Deduplizierungs-Job aus: PowerShell → Start-DedupJob \-Volume 'E:' \-Type Optimization

* Prüfe den Einsparungsstatus: Get-DedupStatus

| Screenshot-Pflicht: Deduplizierung aktiviert im Server Manager \+ PowerShell Get-DedupStatus Ausgabe. |
| :---- |

| A7 | Festplatten-Quoten mit FSRM Thema: File Server Resource Manager, Quota |
| :---: | :---- |

Du richtest für den Buchhaltungsordner eine Festplatten-Quote ein – bei 80% Auslastung wird eine Warnung gesendet, bei 100% ist der Ordner gesperrt.

**Aufgabe:**

* Installiere den Ressourcen-Manager für Dateiserver (FSRM):

* Erstelle eine neue Quota-Vorlage:

* FSRM → Quotaverwaltung → Quotavorlagen → Neue Vorlage

* Name: TW-Buchhaltung-Quota

* Grenzwert: 0,5 MB (niedrig, um Alarm zu testen)

* Soft Quota DEAKTIVIERT (= harte Grenze, sperrt bei 80%)

* Benachrichtigung bei 60% 

* Wende die Quota auf D:\\Freigaben\\Buchhaltung an

* Teste: Kopiere so viele Daten in den Ordner bis 80% erreicht sind (oder simuliere mit einer großen Datei)

| Screenshot-Pflicht: FSRM Quota auf den Buchhaltungsordner angewendet \+ Quota-Details mit 80%-Schwellenwert sichtbar. |
| :---- |

| A8 | Intranet-Webseite mit IIS Thema: Internet Information Services, Webserver |
| :---: | :---- |

TechWork braucht eine interne Webseite für Ankündigungen und Dokumente – erreichbar nur aus dem Firmennetz. Du installierst IIS und veröffentlichst eine Test-Seite.

**Aufgabe:**

* Installiere die Rolle Webserver (IIS) auf TW-DC01

* Erstelle eine einfache HTML-Seite als Intranet-Startseite:

* Pfad: C:\\inetpub\\wwwroot\\index.html

* Inhalt: Firmenname, Begrüßungstext, aktuelle Infos (z.B. 'Willkommen bei TechWork Solutions')

* Konfiguriere IIS: Standard-Webseite soll index.html als Startseite verwenden

* Einmal Internetseite auf dem Server testen über http://localhost:8080

* Öffne auf dem Windows 11 Client einen Browser und rufe auf:

* http://TW-DC01:8080

* oder http://192.168.100.10:8080

* Die Webseite muss auf dem Client sichtbar sein

| Screenshot-Pflicht: IIS-Manager auf dem Server \+ Webseite im Browser auf dem Client geöffnet. |
| :---- |

| A9 | Remote Desktop Services (RDS) Thema: RDS, Remote-Desktop, Desktop-Veröffentlichung |
| :---: | :---- |

Mitarbeiter sollen von außen auf einen vollständigen Windows-Desktop zugreifen können. Du installierst RDS und testest die Verbindung vom Client aus.

**Aufgabe:**

* Installiere die Rolle Remote-Desktopservices auf TW-DC01:

* Über Assistant\! Nicht Rollenbasiert\! 

* Füge die Benutzer der Gruppe 'Remotedesktopbenutzer' hinzu:

* m.huber und t.berger sollen sich per RDP verbinden dürfen

* Teste vom Windows 11 Client:

* Remotedesktopverbindung (mstsc.exe) öffnen

* Ziel: TW-DC01 oder 192.168.100.10

* Anmelden als m.huber mit Domänenkonto (TECHWORK\\m.huber)

* Du solltest den Desktop von TW-DC01 sehen

| Screenshot-Pflicht: RDS-Rolle installiert (Server Manager) \+ RDP-Sitzung vom Client aus geöffnet (Desktop von TW-DC01 sichtbar). |
| :---- |

| A10 | Drucker hinzufügen Thema: Druckverwaltung, TCP/IP-Drucker |
| :---: | :---- |

Im Büro gibt es einen Netzwerkdrucker. Weil noch kein echter Drucker vorhanden ist, fügst du einen Test-Drucker über eine fiktive IP-Adresse hinzu und stellst ihn über das Netzwerk bereit.

**Aufgabe:**

* Installiere die Rolle, die für einen Druckserver benötigt wird

* Öffne auf TW-DC01 die Druckverwaltung (printmanagement.msc)

* Füge einen neuen Drucker über eine TCP/IP-Adresse hinzu:

* IP-Adresse: 192.168.100.200 (fiktiv – der Drucker muss nicht wirklich erreichbar sein)

* Druckername: TW-Drucker-01

* Treiber: Generic / Text only 

* Teile den Drucker im Netzwerk frei:

* Rechtsklick → Drucker freigeben → Freigabename: TW-Drucker-01

* Verbinde den Drucker vom Client aus:

* \\\\TW-DC01 im Explorer → Drucker erscheint → Rechtsklick → Verbinden

* Prüfe: Der Drucker erscheint in der Geräteverwaltung des Clients

| Screenshot-Pflicht: Drucker in der Druckverwaltung auf dem Server \+ Drucker verbunden auf dem Client. |
| :---- |

| A11 | Windows Admin Center (WAC) installieren Thema: WAC, webbasierte Serververwaltung |
| :---: | :---- |

Das Windows Admin Center ist eine moderne, webbasierte Verwaltungsoberfläche für Windows Server. Du installierst sie und verbindest dich damit zum Server.

**Aufgabe:**

* Lade Windows Admin Center herunter:

* microsoft.com/download → suche nach 'Windows Admin Center'

* Installiere WAC auf TW-DC01

* Öffne WAC im Browser auf TW-DC01:

* https://localhost oder https://TW-DC01

* Füge TW-DC01 als verwalteten Server hinzu (er sollte bereits vorgeschlagen werden)

* Füge den Client hinzu, sodass du theoretisch beides im WAC verwalten könntest

* Erkunde das Dashboard: CPU, RAM, Events, Speicher

| Screenshot-Pflicht: WAC-Startseite mit TW-DC01 verbunden \+ Server-Dashboard (CPU, RAM, Speicher sichtbar). |
| :---- |

| A12 | Backup mit Windows Server Backup  Thema: Datensicherung, Windows Server Backup Rolle |
| :---: | :---- |

Das Unternehmen braucht eine regelmäßige Datensicherung. Du richtest Windows Server Backup ein und sicherst den wichtigsten Ordner – die Freigaben der Mitarbeiter.

**Aufgabe:**

* Installiere das Feature **Windows Server-Sicherung**: Server Manager 

* Erstelle eine **einmalige manuelle Sicherung** (zum Testen): 

  * Zu sicherndes Element: D:\\Freigaben (die Ordner aus A2)

  * Zielort: Ein separates Volume oder Ordner, z.B. E:\\Backup

* Richte zusätzlich einen **Sicherungszeitplan** ein: 

  * Täglich um 23:00 Uhr

  * Gleiche Quelle und Ziel wie oben

* Warte bis die manuelle Sicherung abgeschlossen ist

* Prüfe den Status: „Die Sicherung war erfolgreich"

**Screenshot-Pflicht:** Windows Server-Sicherung mit Status „erfolgreich" \+ konfigurierter Zeitplan sichtbar.

**★  BONUS / Fortgeschrittene Aufgabe**

| A13 | Failover Cluster Thema: Hochverfügbarkeit, Cluster, Shared Storage |
| :---: | :---- |

Das ist die anspruchsvollste Aufgabe. Du baust einen Windows Failover-Cluster mit zwei Knoten und gemeinsam genutztem Speicher – und testest ob der Dienst bei Ausfall eines Knotens weiterläuft.

| Diese Aufgabe braucht 3 zusätzliche VMs\! Stelle sicher, dass deine Hardware genug Ressourcen hat. Baue zuerst A1–A12 vollständig ab, bevor du hier anfängst. |
| :---- |

**Benötigte VMs:**

| VM-Name | Rolle / IP |
| :---- | :---- |
| TW-CL1 | Cluster-Node 1 (Windows Server) – IP: 192.168.100.21 |
| TW-CL2 | Cluster-Node 2 (Windows Server) – IP: 192.168.100.22 |
| TW-STOR1 | Shared Storage (iSCSI-Target) – IP: 192.168.100.30 |

**Aufgabe:**

* Alle drei VMs der Domäne techwork.local beitreten lassen

* Auf TW-CL1 und TW-CL2: Rolle 'Failovercluster' und 'Dateiserver' installieren

* Auf TW-STOR1: iSCSI-Target Server Rolle installieren, virtuellen iSCSI-Disk erstellen und für CL1 \+ CL2 freigeben

* Shared Disk auf CL1 initialisieren und als Cluster Shared Volume (CSV) formatieren

* Auf TW-CL1: Failover Cluster Manager öffnen → Neuen Cluster erstellen:

* Clustername: TW-CLUSTER

* Cluster-IP: 192.168.100.25

* Beide Knoten TW-CL1 und TW-CL2 hinzufügen

* Clustervalidierung durchführen

* Dateiserver-Rolle im Cluster konfigurieren (Hochverfügbarkeits-Dateiserver)

* Failover testen:

* Überprüfe auf welchem Node der Dateiserver läuft

* Fahre diesen Node herunter  

* Cluster Manager: Dateiserver wechselt automatisch auf den anderen Node

* Zugriff auf den freigegebenen Ordner bleibt erhalten

| Screenshot-Pflicht: Failover Cluster Manager mit beiden Knoten Online \+ Failover-Test: Knoten 1 offline, Rolle läuft auf Knoten 2\. |
| :---- |

# **5  Abgabe-Checkliste**

| Gehe diese Liste durch bevor du abgibst. Jeder Punkt braucht einen Screenshot als Nachweis. |
| :---- |

## **Basis-Setup**

* ☐ TW-DC01 läuft als Domänencontroller für techwork.local

* ☐ TW-CLIENT01 ist der Domäne beigetreten

* ☐ Drei Benutzer m.huber, t.berger, s.wagner im AD vorhanden

## **A1 – Active Directory**

* ☐ OUs TW-Mitarbeiter, TW-Gruppen, TW-Computer angelegt

* ☐ 4 Sicherheitsgruppen existieren

* ☐ Benutzer sind in der richtigen Gruppe

## **A2 – NTFS & Freigaben**

* ☐ 4 Ordner mit Testdateien angelegt

* ☐ Freigaben erreichbar über \\\\TW-DC01

* ☐ NTFS-Rechte per Gruppe gesetzt

* ☐ Test vom Client: Zugriff erlaubt/verweigert wie erwartet

## **A3 – GPO Hintergrundbild**

* ☐ GPO-TW-Desktop existiert und ist mit OU verknüpft

* ☐ Hintergrundbild auf Client erzwungen und sichtbar

## **A4 – RAID / Storage Spaces**

* ☐ 2 zusätzliche Disks dem Server hinzugefügt

* ☐ Speicherpool Pool-TW-Daten erstellt

* ☐ Virtueller Datenträger VDisk-Mirror mit Mirror-Layout

* ☐ PowerShell: HealthStatus Healthy

## **A5 – BitLocker & EFS**

* ☐ Volume F:\\ mit BitLocker verschlüsselt

* ☐ EFS-Datei mit grüner Schrift im Explorer sichtbar

## **A6 – Datendeduplizierung**

* ☐ Deduplizierung-Feature installiert

* ☐ Deduplizierung auf Volume aktiviert

* ☐ Get-DedupStatus zeigt Ergebnis

## **A7 – FSRM Quota**

* ☐ FSRM installiert

* ☐ Quota auf D:\\Freigaben\\Buchhaltung angewendet

* ☐ 80%-Benachrichtigung konfiguriert

## **A8 – IIS Intranet**

* ☐ IIS installiert

* ☐ index.html mit Firmeninhalt erstellt

* ☐ Webseite vom Client aus erreichbar (http://TW-DC01)

## **A9 – RDS**

* ☐ RDS-Rolle (Session Host) installiert

* ☐ Benutzer in Gruppe Remotedesktopbenutzer

* ☐ RDP-Verbindung vom Client funktioniert

## **A10 – Drucker**

* ☐ Drucker TW-Drucker-01 auf Server hinzugefügt

* ☐ Drucker freigegeben

* ☐ Drucker vom Client verbunden

## **A11 – Windows Admin Center**

* ☐ WAC installiert

* ☐ Zugriff auf WAC-Dashboard funktioniert

* ☐ TW-DC01 im WAC sichtbar und verbunden

## **A12 – Windows Server Backup**

* ☐ Windows Server-Sicherung Feature installiert

* ☐ Manuelle Sicherung von D:\\Freigaben erfolgreich abgeschlosen 

* ☐ Sicherungszeitplan für 23:00 Uhr konfiguriert 

## **A13 – Failover Cluster (Bonus)**

* ☐ Drei zusätzliche VMs laufen und sind in der Domäne

* ☐ Cluster TW-CLUSTER erstellt mit TW-CL1 und TW-CL2

* ☐ Cluster Shared Volume konfiguriert

* ☐ Dateiserver-Rolle im Cluster läuft

* ☐ Failover-Test bestanden: Rolle wechselt auf anderen Knoten

| Viel Erfolg\! Wenn du auf Probleme stößt: Fehlermeldung genau lesen, Google/KI nutzen, Mitschüler fragen. Jeder Admin hatte am Anfang diese Probleme. Dranbleiben zahlt sich aus. |
| :---- |

