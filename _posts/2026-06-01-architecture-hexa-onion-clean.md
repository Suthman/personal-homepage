---
title: "Clean Architecture"
excerpt: "TODO"
categories:
  - Blog
tags:
  - architecture
toc: true
toc_sticky: true
toc_label: "TODO"
toc_icon: "gears"

---

{% include ai-disclaimer-short.html %}

TODO einleitung

## Clean Architecture vs Onion Architecture vs Ports and Adapters

Robert C. Martin (Clean Architecture), Jeffrey Palermo (Onion Architecture) und Alistair Cockburn (Hexagonal Architecture / Ports and Adapters) haben unabhängig voneinander das gleiche Problem gelöst: die Entkopplung der Geschäftslogik von technologischen Details.

### Die Kernphilosophie (Was alle drei teilen)
- Die Abhängigkeitsregel: 
Die Geschäftslogik steht im Zentrum und weiß nichts von Datenbanken, UIs oder Frameworks. Abhängigkeiten zeigen immer nur nach innen.
- Austauschbarkeit: Du kannst die Datenbank (z. B. von PostgreSQL zu MongoDB) oder das Interface (z. B. von REST-API zu CLI) austauschen, ohne ein einziges Byte der Kern-Geschäftslogik zu ändern.
- Testbarkeit: Der Kern kann isoliert und ohne langwieriges Hochfahren von Infrastruktur getestet werden.

### Die Unterschiede im Detail
 Hexagonal (Ports & Adapters)  ➔  Onion Architecture  ➔  Clean Architecture
     (Fokus: Grenzen)            (Fokus: Schichten)       (Fokus: Komponenten/SOLID)
    
#### Hexagonal Architecture (Ports and Adapters) – Der Ursprung (2005)
- Der Fokus: Konzentriert sich primär auf die Schnittstelle zwischen der Anwendung und der Außenwelt.
- Wie es funktioniert: Das System wird als Hexagon dargestellt (die Form hat keine tiefere Bedeutung, sie bietet nur viel Platz für Kanten). Der Kern definiert Ports (Interfaces). Die Außenwelt dockt über Adapters an diese Ports an.
- Eingehende Adapter (z. B. REST-Controller) rufen einen Inbound Port (Use Case) auf.
- Ausgehende Adapter (z. B. SQL-Repository) implementieren einen Outbound Port (Datenbank-Interface).
 

#### Onion Architecture – Die Verfeinerung (2008)
- Der Fokus: Bringt Struktur innerhalb des Hexagons durch konzentrische Schichten (wie die Schichten einer Zwiebel).
- Wie es funktioniert: Palermo unterteilte das Innere des Systems genauer. Er trennte strikt zwischen dem reinen Domänenmodell (Domain Model), den Domänendiensten (Domain Services) und den Anwendungsdiensten (Application Services). Dies brachte die Prinzipien des Domain-Driven Design (DDD) fest in das Muster ein.

#### Clean Architecture – Die Synthese (2012/2017)
- Der Fokus: Robert C. Martin hat die Hexagonale und die Onion Architecture genommen, sie kombiniert und mit seinen SOLID-Prinzipien und Komponentenregeln untermauert.
- Wie es funktioniert: Er standardisierte die Begrifflichkeiten (Entities, Use Cases, Interface Adapters) und erklärte detailliert, wie der Kontrollfluss mittels des Dependency Inversion Principle (DIP) zur Laufzeit umgedreht wird, damit die Quellcode-Abhängigkeit stabil nach innen zeigt.
