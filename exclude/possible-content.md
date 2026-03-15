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



#### How could book summaries be presented? Collections or blog posts?

##### books as post -> own category Key Takeaways 
``` 
title: "Bücher für den Job"
layout: category
permalink: /categories/key-takeaways/
taxonomy: key-takeaways
entries_layout: grid # grid or list; list is default  
```
##### books as collections? 


### Denied questions and tasks
- Can my publications be displayed "better" than the current bullet list? E.g. is it a collection?  
  Answer: There are possibilities, but the best one seems to be an ordering auf the list by years -> not worth is, since the newest one is from 2013
- Can I use public comments provider?
  Answer: There are some available. Problem: If people do not need to authnticate, SPAM might become a problem. I decided to use mail as feedback loop

---

## Key-take-aways

- Evolutionary architectures (book)
- Team Topologies (book)
- Architecture Elevator (book)
- Camunda Book (book)

---

## Possible future blogs



- event-storming (`ddd`, `architecture`)
  - first contact after book -> BOOK reference   [Domain-Driven Design kompakt](https://dpunkt.de/produkt/domain-driven-design-kompakt/) (ISBN: 978-3-86490-439-4) being a translation of [Domain-Driven Design Distilled](https://www.pearson.com/en-us/subject-catalog/p/domain-driven-design-distilled/P200000009615/9780134434995) by Vaughn Vernon (ISBN: 9780134434995)
  - sticky-note method
  - short explanations: event, command, bounded context, aggregate
  - fachlich verteiltes modell -> no direct correspondance to microservice or any other technical entity
  - linguistic trick: turn "foreign" event into internal command -> corresponds to a translation from one context into another
  - Many teams have adopted ES and every session was feedbacked positive!

- ddd: commands and event interaction, only (`ddd`, `architecture`)

- documentation: arc42 and ADRs (`architecture`, `documentation`)

- hexagonal architecture goes micro-service (`architecture`, `DDD`, `micro-service-architecture`

- make or buy - wertschöpfungstiefe (`other`)

- Prompting (AI)

- PC setup (other)
  - Thunderbid with plugin `CardBook`
  - Notepad++ with plugins `Compare` and `Markdown Panel`