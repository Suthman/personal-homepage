# Possible future content

Possible future content is listed here.

---

## TechnicaL TODOs

### Open questions and tasks

- Check tags- and categorie pages when there are more posts available. 
  - view https://github.com/mmistakes/mm-github-pages-starter/blob/master/_config.yml 'category_archive' and 'tag_archive'
  - try `related=true`
- Logo. Design advice of google
```
Design-Ideen für das Logo:
Linienkunst (Line Art): Ein abstraktes Haus oder ein Grundriss, der nur aus feinen, schwarzen Linien besteht. Das wirkt präzise und professionell.

Initialen-Kombination: Deine Initialen „CM“ geometrisch angeordnet, sodass sie wie ein architektonisches Element oder eine Säule wirken.

Geometrie: Ein Spiel mit Quadraten oder Dreiecken, die Tiefe und Struktur erzeugen.

Farben: Bleib bei Schwarz mit transparentem Hintergrund. Das passt perfekt zum Standard-Design der Seite.
```
- FAV Icon
  - **Im Root-Verzeichnis (Hauptordner)**: Die einfachste Methode ist eine Datei namens favicon.ico direkt im Hauptverzeichnis deines Projekts. Browser suchen dort standardmäßig danach, auch ohne expliziten Code-Hinweis.
  - **Im Assets-Ordner**: Häufig wird das Favicon unter /assets/images/favicon.png (oder .ico) gespeichert, um das Hauptverzeichnis sauber zu halten. Damit es dort gefunden wird, muss es in der Datei _includes/head/custom.html verlinkt sein. 
    - Schau in deinem Projektordner nach der Datei _includes/head/custom.html. Wenn dort eine Zeile wie die folgende steht, kommt das Icon genau von diesem Pfad: 
``` html
<link rel="shortcut icon" type="image/x-icon" href="/assets/images/favicon.ico">
``` 



---

## Key-take-aways

- Evolutionary architectures (book)
- Team Topologies (book)
- Architecture Elevator (book)
- Camunda Book (book)

---

## Possible future blogs


- ddd: (`ddd`, `architecture`)
  - commands and event interaction, only 
  - linguistic trick: turn "foreign" event into internal command -> corresponds to a translation from one context into another
  - short explanations: event, command, bounded context, aggregate
  - fachlich verteiltes modell -> no direct correspondance to microservice or any other technical entity

- documentation: arc42 and ADRs (`architecture`, `documentation`)

- hexagonal architecture goes micro-service (`architecture`, `DDD`, `micro-service-architecture`

- make or buy - wertschöpfungstiefe (`other`)

- Prompting (AI)

- PC setup (other)
  - Thunderbid with plugin `CardBook`
  - Notepad++ with plugins `Compare` and `Markdown Panel`