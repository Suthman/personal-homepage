---
title: "Book Review: 'Clean Architecture' by Robert C. Martin"    
excerpt: "My raw notes, key takeaways, and a structured summary of 'Clean Architecture'"
categories:
  - blog
tags:
  - book-review
toc: true
toc_sticky: true
toc_label: "Clean Architecture"
toc_icon: "fa-solid fa-layer-group"
header:
  overlay_image: /assets/images/2026-review-clean-architecture/clean_architecture_title_german.jpg
  overlay_filter: 0.5 # Darkens the image (0.1 to 1.0) to keep the text readable
---

<style>
  .page__hero--overlay {
    background-size: contain !important; /* Fit the entire overlay image without cropping */
  }
</style>

{% include ai-disclaimer-short.html %}

This post is a book review as introduced in [Professional Book Review](/blog/started-book-reviews)

TODO: STICHPUNKTE FORMATIEREN - TODO BEARBEITEN - SUMMARY NEU GENERIEREN - TAGS VERGEBEN

## 📋 Quick Facts

- <img src="{{ '/assets/images/2026-review-clean-architecture/clean_architecture_title_original.jpg' | relative_url }}" alt="Domain-Driven Design Distilled" style="float: right; margin-left: 20px; margin-bottom: 20px; width: 75px; border-radius: 4px;">
**Book:** _Clean Architecture_   
German translation of [Clean Architecture](https://www.isbn.de/9780134494166)
- **Author:** Robert C. Martin   
translated from English by Maren Feilen and Knut Lorenzen
- **Target Audience:** IT Architects / Software Developers
- **My Rating:** ⭐⭐⭐⭐⭐ (5/5) - Highly Recommended / Must Read
- **Link:** [Clean Architecture](https://www.mitp.de/IT-WEB/Software-Entwicklung/Clean-Architecture.html) or [ISBN: 9783958457249](https://www.isbn.de/9783958457249)


> **Quick Verdict:** TODO 2 sentences.


## 💡 My Key Takeaways & Actions

TAKE AWAYS
- wartbarkeit wichtiger als wiederverwendung
- deployable units are compilations, not executables -> have to take care in Bewertung
- TODO ARE METRICS LIKE STABILITY AND ABSTRACTION AVAILABLE IN TOOLS (CH 14)
- **Efficacy of functional decomposition** in ch 4
- policies and details  in ch 1
  - use cases are primary objective
  - defer decisions about details -> archtecture probides options -> same argument as in "arch elevator"
- layer Definition (Ch 19) is new for me
- entities and use cases are precisely defined
- Problem of microservices, when cross cutting concerns is across services abd not between! Can only be solved, when each service is based on SOLID components
- ch 24 partial boundaries: can risks be reduced by arcunit? Same holds for ch 34
  - forgot the name


## 🔍 The Deep Dive (Summary)
{% include book-review-disclaimer.html %}


## 📝 Appendix: Raw Reading Notes
{% include book-review-disclaimer.html %}


### PART I — Introduction

#### Chapter 1 — What is Design and Architecture?
- **Equivalence of concepts**: Software design and software architecture represent identical concepts.
- **Architectural objectives**: The primary objective of software architecture is detailed on page 30. TODO COPY
- **Maintainability case study**: The case study demonstrates that developing software without prioritizing maintainability increases the total cost of ownership (TCO) and decreases developer velocity.
- **Productivity through TDD**: Implementing [Test-driven development](https://en.wikipedia.org/wiki/Test-driven_development) enhances engineering productivity, as noted on page 36.
- **Flawed deployment mindsets**: A common, erroneous mindset dictates launching the product to the market immediately while postponing refactoring and testing for a later phase.
  - Note: That designated time for optimization never materializes.
  - Rebuilding the system fails to resolve the underlying issue because market pressure persists throughout the entire rebuilding phase.

#### Chapter 2 — A Tale of Two Values
- **Dual values of software**: Software systems deliver value through two primary dimensions: behavior and structure.
  - The behavior of a system fulfills the specified functional requirements.
  - A robust structure supports system adaptability, including maintainability and testability.
  - The term "software" itself implies a medium designed to be soft and adaptable.
- **Primacy of adaptability**: Adaptable systems are inherently superior to systems that merely exhibit correct behavior, as adaptable systems can be fixed and evolved, whereas the latter are strictly rigid.
- **Core architectural focus**: The fundamental purpose and focus of software architecture is to maximize **adaptability**.


### PART II — Starting with the Bricks: Programming Paradigms

#### Chapter 3 — Paradigm Overview
- 3.1, 3.2 and 3.3: copy the summary!!! TODO

#### Chapter 4 — Structured Programming
- **Structured programming paradigms**: Structured programming restricts the use of unrestricted transfer control statements (such as `goto`) and replaces them with standardized control flows like sequence, selection (`if/then/else`), and iteration (`do/while`).
  - This paradigm aligns with theoretical findings demonstrating that any computable program can be constructed exclusively using sequence, selection, and iteration.
- **Composability of software units**: Software architectures are inherently composable, built from smaller, modular sub-units.
  - Mathematically, if each sub-module could be proven to operate entirely without error, the aggregate program would itself be error-free.
  - In practice, empirical software testing can only demonstrate the presence of errors, never their complete absence.
  - Despite this limitation, robust and comprehensive testing of individual sub-modules yields a high statistical probability that the overall system will contain minimal defects.
- **Efficacy of functional decomposition**: Structured functional decomposition remains a highly effective strategy for managing system complexity.

#### Chapter 5 — Object-Oriented Programming
- **Safety in polymorphism**: Object-oriented programming provides polymorphism in a safe, stable, and highly manageable manner.
  - This technical capability directly enables the implementation of the Inversion of Control (IoC) paradigm, representing a critical architectural value. TODO PARADIGM
- **Decoupling of dependency structures**: Software architects can structure source code dependencies independently, removing the constraint to follow the runtime control flow of the program.
  - For example, this mechanism allows engineering teams to build core domain logic entirely independent of database access layers, successfully separating domain business logic from technical infrastructure concerns.

#### Chapter 6 — Functional Programming
- **Immutability in functional programming**: The functional programming paradigm dictates that variables cannot be explicitly altered after initialization.
  - Eliminating mutable state inherently resolves critical concurrency issues, such as race conditions and resource deadlocks.
- **Architectural implications of functional programming**: Adopting functional principles shifts how system state and logic are distributed across an application.
  - Software architects must isolate variable manipulations and state changes into dedicated, explicit modules, designated as mutable components.
  - Conversely, engineering teams should encapsulate the vast majority of domain logic and runtime complexity within stateless, immutable components.


### Part III — Design Principles
- **Architectural goals**: Enable modification, ensure easy traceability, and facilitate the reuse of middle-layer software architecture.
- **Scope of middle layer**: Define the middle layer at the module level, positioned directly above the source-code level.
- **Core design principles**: The following five principles are recognized by the acronym SOLID (note the slight differences in the definitions here compared to [Wikipedia](https://en.wikipedia.org/wiki/SOLID)):
  - **SRP**: The Single-Responsibility Principle  
  The optimal structure for a software system is heavily influenced by the social structure of the organization utilizing it, ensuring that each software module has one — and only one — reason to change.
  - **OCP**: The Open-Closed Principle  
  Design software systems to facilitate easy adaptation, ensuring that behavioral modifications are achieved by adding new code rather than modifying existing code.
  - **LSP**: The Liskov Substitution Principle  
  Constructing software systems with interchangeable objects requires that these components must be mutually substitutable.
  - **ISP**: The Interface Segregation Principle  
  Avoid dependencies on unutilized modules.
  - **DIP**: The Dependency Inversion Principle  
  Code implementing high-level policies must not depend on code implementing low-level details; instead, details must depend on policies.

#### Chapter 7 — SRP: The Single-Responsibility Principle
- **Definition**: Define a module in this context as being responsible to one single actor.
- **Misconception correction**: Do not assume every module must perform only a single task; this rule applies strictly to functions and methods, not to modules.
- **Original definition**: Maintain the original definition stating that there should be only one reason to change a module.
- **Future architectural mappings**: Anticipate that this concept will reappear in subsequent architectural layers as the Common Closure Principle (CCP) and the axis-of-change model. TODO VERWEISE

#### Chapter 8 — OCP: The Open-Closed Principle
- **Definition**: A software entity must be open for extension but simultaneously closed to modification.
- **Architectural motivation**: Recognize this principle as the fundamental motivation driving software architecture.
- **Core methodology**: 
  - Decompose the system into distinct components and establish a suitable dependency hierarchy, ensuring higher-level components are protected from changes in lower-level components.
  - Note that excellent illustrative examples are provided within the book.

#### Chapter 9 — LSP: The Liskov Substitution Principle
- **Formal Liskov Substitution Principle definition**: The objective is to achieve a substitution property where if, for each object $o_1$ of type $S$, there exists an object $o_2$ of type $T$ such that for all programs $P$ defined in terms of $T$, the behavior of $P$ remains unchanged when $o_1$ is substituted for $o_2$, then $S$ is a subtype of $T$.
- **Historical context and scope expansion**: The principle was originally developed to handle inheritance in programming languages, but it should be viewed more generally to encompass all types of interfaces and components.
- **Architectural impact of violations**: A single violation can have a massive impact on maintainability, as numerous exceptions must subsequently be added, maintained, and understood.


#### Chapter 10 ISP: The Interface Segregation Principle
- define different interfaces for different purposes
- originally drfind for Statistik LinkedIn programming languages
- but also generalizes to All kinds oh components
- more General formulation: do not rely on modules that provide more than you require
- common-reuse-principle in Ch13 -> link!

#### Chapter 11 — DIP: The Dependency Inversion Principle
- source code dependencies should be abstractions, only. Thus rule is very strict and hard to implementiert. But it is possible to isolate concrete dependencies in factories.
- operating system and Plattform entities are usually excluded from this rule (eq String class in Java
- stable abstractions
  - do not reference concrete classes
  - do non inherit from concrete classes
  - do not overide concrete methods
  - do not mention  concrete elements by name - never ever
- use abstract factories to instantiate concrete implementations
  - example of p. 110
  - Spring (Boot) context does automate this kind of instantiation


### PART IV — Component Principles

#### Chapter 12 — Components
- components are deployable units, eg har files
- historical overview for Compiler and linker. In short: plugin System for jars, DLLs, ... is Standard nowadays

#### Chapter 13 — Component Cohesion
- REP: reuse-release-equivalence-principle
  - todo: Definition p 121
  - you can just reuse, what is in in one named component with same Version number, relesse doc, etc
- CCP: common-closure-principle
  - todo: Definition on p 123
  - there should only be one reason to change the module
  - generalization of SRP TODO LONG VERSION
  - also related to OCP TODO LONG VERSION: "closed for modications" cannot be reached completel. CCP requires thus on "higher component level"
  - generalization of SRP and OCP TODO ON P 124
- CRP: common-reuse-principle
  - TODO DEFINITION on p 124
  - put components together that are usually used together
  - separate classes thatvare usually not used together
  - relation to ISP TODO LONG NAME: ISP requires to separate interfaces when methods are usually not used together.
- Common Nenner of ISP and CRP: TODO COPY FROM P 125
- the 3 principles are in Opposition
  - REP tends to create big components to reduce their number
  - CRP tends to create small components to reduce non-needed dependencies
  - CCP organizes the components from a maintenance efgort point of view
  - the optimal components Definition may change iver time anf project affordances. A Tenside dusgram is on p 126

#### Chapter 14 — Component Coupling
- ADP: acyclic-dependency-principle
 - todo Definition p 129
  - violations result in complex integration Management and betroffenheitsanalsen
  - overcome cyvles: DIP TODO LONG or create New component
- top down Design not recomnended
  - not enough kniwledge upfront
  - design is controlled by SRP and CCP todo long versions
- SDP: stable-dependeny-principle
  - todo Definition p 139
  - stability of components := effort to change the component
  - metrics for stability I:
    - todo define fan-in and out!!
    - I = fan-out / (fan-out + fan-in)
    - I=0 maximal stable, I=1 maximal instable
  - SDP: I-value of a component should be higher since I-values of dependent components
  - Note: Not all components should be stable
- SAP: stable-abstraction-principle
  - todo Definition p 143
  - common politische should be stable but also accessable by many components-> they should be abstract!
  - SAP: stability of a component should relate to its abstraction
  - SAP + SDP are somehow a "DIP for components"
  - metrics for abstraction if components:
    - copy from p144 todo
    - A=0 no abstract classes, A=1 all classes are abstract
- the I/A graph copy  todo p 145
  - Zone of pain
    - stable (many dependen components) and concrete (hard to change)
    - examples: database Schema, java String class
  - Zone of Uselessness
    - many absteact classes that are not referenced
  - Hauptreihe todo translate!
    - represents the desired offset of stability and abstraction
    - distance D from Hauptreihe: D=|A+I-1|
    - enables statisticalanalysis, eg
      - look at normal dustrubtion and analyse components with D>standard deviation
      - Look at D of a component over time


### Part V — Architecture

#### Chapter 15 — What is Architecture?
- Provide a "form", i.e. structure, for software systems
  - structure: components and its interactions
- Note: behaviour is determined by functional requirements, i.e. support of the required use cases primary objective
- goal: minimize lifetime costs over phases:
  - development
  - deployment
  - Operations
  - maintenace
- create/maintain options
  - todo copy Italien  sentence of p 159
  - separate policies (business logic) from details
  - examples for details:
    - database
    - web framework
    - Device specifics

#### Chapter 16 — Independence
- operations: defere decision as long as possible. If component structure is good, we can later decide on concrete deployent and Operation modi
- consider Team structure in component Design by considering [Conway's law](https://en.wikipedia.org/wiki/Conway%27s_law): 
> [O]rganizations which design systems (in the broad sense used here) are constrained to produce designs which are copies of the communication structures of these organizations.
- Decoupling
  - decouple (horizontal) layers
    - follow SRP and CCP
    - decouple details (e.g. UI and database access) fro. Business rules
  - decouple (vertical) use cases
    - "A order" is different from "Delete order"
  - enables independant development and deployment!
- Duplication
  - two kinds: Real duplication vs. Versehentlich duplication todo translation
  - eliminate first one!
  - resist to eliminate second one! Example: similar looking Display output: good Chance hat they will differ in future when not Displaying the same
- decoupling (again)
  - different levels: source code, deployment, service
  - Also defer as long as possible
  - note: most suitable level might change over time!

#### Chapter 17 — Boundaries: Drawing Lines
- draw lines to protect omportant parts (business rules, policies, ...) from details
- imagine lines as plugin-system: you can plugin different GUIs or databases to your system as long as the businnes cases are protected against these details
- lines are an application of DIP and SAP

#### Chapter 18 — Boundary Anatomy
- Monolith vs deployments (package boundaries)
  - different methods to ensure the component paradigms
  - modulith: one deployment unit for all (logical) components -> component paradigms still valuable for testing, simplicity etc
  - deployments: each component is one deployment unit
- runtime execution bundaries
  - threads: different runtime executions in same process.
    - Very fast exchange via common memory access.
  - local processes: several instances of components run on same machine within different os-procsses
    - slower communication via inter-procces communication
  - each process can itself employ several threads if desired
- services: several instances started as several services
  - communication via Network protocols: quite slow
  - each service can use local processes or thread if desired
  - services can be deployed to different machines

#### Chapter 19 — Policies and Level
- policies represent (high level?) business logic
- level
  - Definition of level: distance between input and output
  - components with same distance should be grouped on same level
  - note: example uses SRP, OCP, CCP, DIP, SDP and SAP

#### Chapter 20 — Business Rules
- business rules
  - Critical business rules: Richtlinie oder Verfahren,  das zur erwirtschaftung oder Einsparung von geschäftskapital führt  todo translate
    - would also be applied without computer systems!
  - critical business data: Daten zur Berechnung der crtical business rules
  - entity: object within an computer system representing a (small) portion of critical  business rules
    - create class and separate it from all other aspects of the system!
- use cases
  - not as puristic as critical  business rules -> application specific business rules
  - are required to be handled in an automatic system
  - example: contact data of customers have to be created befor she can order something
  - use case orchestrate entities,  but entitues are not Amaretto of use cases. Use case are "closer" to input / output but still protected from details
  - request/Response models
    - required sube use cases get input and produce output. BUT: the classes should be without any dependencies to frameworks or even entities.  They will change over time for different reasons and violate CCP and SRP

#### Chapter 21 — Screaming Architecture TODO CHECK TRANSLATION (FOR ALL CHAPTERS)
- an applications archtectur should should its purpose. Since use cases are first class citizebs and primary objective: it should shout its use cases and not its frameworks!
- frameworks are tools and no lebenseinstellung - they are just details !
- when zse cases are free of frameworks, simple unit tests can be applied to test your use cases and entities

#### Chapter 22 — The Clean Architecture
- todo mention references from p211
  - common:
    - usage of layers to separate system aspects TODO REFINE TEXT p212
    - framework independency
    - testability
    - UI independency
    - DC independency
    - External independency
- Clean architecture picture: p212 (better with color?!)
- Dependency Rule
  - Definition from p213 todo
  - entities encapsulate enterpriese wide business rule, ie critical business rules
    - change probability is low!
  - use cases realize application specific business rules
    - changes here will not affect entities, e.g. changes in GUI or DB will have not impact here!
- interface adapters
  - goal: adapt between entities and usecase on the one fand and external components like DB or web-ui
  - still be independant of frameworks or concrete technologies
- frameworks and drivers
  - here are all the concrete details
  - highest distance to business logic
- you can add more layers/circles if you want, but: the dependency rule must hold!
- cross boundaries by applying DIP
  - ! use simple data Transfer objects to cross the border. Do not uses entities or framework specific types!
- see example on p217 for a typical application flow with boundary crossing

#### Chapter 23 — Presenters and Humble Objects
- Humble Object as test support
  - originally defined to separate hard to test system behavior from simple to test behavior
  - humble contains hard to test behavior in very reduced manner
  - UI interactions are often hard to test
- presenters and views
  - component 'View' is the humble object. It moves data to the GUI without changing it
  - component 'Presenter'
  - responsibility: Format data to required formats and put it into 'View Model' which can be accessed by 'View'
  - all presentation relevant data and attributes are put into 'View Model'
- database Gateways
  - each required data access in use level is defined as interface
  - database gatewas then implement these interfaces in the vdb- layer
  - implementation is not humble, but use-case interfaces can be tested easily
  - note: Data Mappers, i.e. ORM-frameworks, belong to database components
- Service listenerscare Implemented analoguosly to database Gateways !

#### Chapter 24 — Partial Boundaries
- complete boundaries can be expensive, thus partial boundaries can be suitable
- Option 1: no layer-specific builds
  - Leave away the packaging, i.e. less effort for release and deployment Management Todo was heißt reziprok?
  - development and maintenance effort remains
- Option 2: Strategy Pattern
  - dependency rule can be violated quite simple
- Option 3: facade Pattern
  - transitive dependency exist
  - even less strict boundary as in strategy pattern

#### Chapter 25 — Layers and Boundaries
- where go put vollwertige  archtectural boundaries?
  - they empose costs
  - missing noundsries can emposesveven more costs
- Wumpus World example in this chapter is interesting

#### Chapter 26 — The Main Component
- the ultimate details
- creates all factories, strategies, global instances
- all its dependencies should be injected by dependency-Injection-frMedotk at hand and be distributed throughout the qhole system
- is an non-clean component in the outmost ring of the clean architecture

#### Chapter 27 — Services: Great and Small
- Service archtecture?
  - usage of services is a deployment and runtime details, no archtecture
  - architecture is defined by  boundaries separating übergeordnete policies from untergeordneten details
- Advantages of services?
  - Trap 1: decoupling
    - correct in the sence of the runtime
    - But: when a data-object being transferred between services needs to be changed,  there is a domain coupling, ie a similar coupling as between functions within one program
  - Trap 2: independant development and deployment
    - deployment activities still have to be coordinated
- cross-cutting concerns are not handled by "micro-service architectures" more easily than in other systems
  - compare cat Problem on p243ff
  - can be solved with services, when each service us build based on SOLID component design
  - must be the case since runtime is just an architectoral detail!
  - reason is quite simple: cross-cutting concern in this case is not between services, but across services

#### Chapter 28 — The Test Boundary
- test are part of the system
- fragile test problem: changes of central components can result in huge number of test failures
- solution: test should not depend on flüchtige components like GUIs
- provide test API independant of appliation structure
- ensure the structural decoupling of tests from production code
- security aspect: test should be independant deployments to ensure that there is no dependency from production to test code

#### Chapter 29 — Clean Embedded Architecture
- firmware is software bound to technology
  - using SQL is firmware
  - using Android API is firmware
- stop writing firmware, start writing software!
- solution for embedded systems: 3 layers
  - Software, Firmware, Hardware
  - put HAL (hardware abstraction layer) between software and firmware
    - no new concept; For PCs it exists länger than Windows
    - HAL must know hardware details
  - processor is a detail: firmware layer must protect rest of system from processor  specialities
- operating system is a detail
  - add operating system and OSAL (operating system abstraction layer)


### PART VI — Details

#### Chapter 30 — The Database is a Detail
- data models are important, databases are a detail
- why is discussion so intense? Data is stored on hard drives, which are slow! A lot of effort is required to make it as fast as possible. But in the end is a database just a technology to store sata persistently

#### Chapter 31 — The Web is a Detail
- permanent pendelausschlag: put compute to cenzral Servers or to decentral clients?
- GUI Layouts can change fo Marketing reasons
  - treat UI as a detail and protect higher components from changes!
  - Web is an I/O device

#### Chapter 32 — Frameworks Are Details
- asymmetrische ehe
  - you create your application around the framework, ie you create a strong coupling
  - the framework authors have no Verpflichtungen
- solutions: use frameworks, but treat them as details in outer rings
  - "get the milk without buying the cow"! todo geht das in englisch?
- sometimes you have no choice: when using java, you will depend on the standard-library

#### Chapter 33 — Case Study: Video Sales
- start with use case Analysis
  - there can also be abstract use cases
  - use cases are assigned to actors
- component architecture
  - Views, presenters, interactors, controllers
  - archtectural boundaries
- exact deployment structures can be decided later

#### Chapter 34 — The Missing Chapter
- problems occur during execution
- Package by layer
  - good start for simple applications
  - but: does not shout out its use cases!
- package by Feature
  - put all verticals in lne package
  - but: hard to respect boundaries in the long term
- Ports and Adapters
  - domain logic inner rings, Infrastructure in outer rings
  - note: inner rings contain ubiquotous language from DDD todo reference ddd book
- Package by Component
  - allthough being behind SOLID, REP, CCP and CRP, should code organization be treated differently
  - organice domain logic and persistence code in one package. Avoids that component internal interface (like OrderRepository) must be public!
  - different definition of component from "C4 Software Architecture Model" todo copy from p303f and reference and read
  - still maintain separation of domain logic and persistence as Implementation detail of the component!
- devil lies in implementation details
  - public is used too often in languages like Java
  - organization vs encapsulation
      - when all types are public, all presented code organizations are equal, since public classes can be used from everywhere
      - using packages for encapsulation requires to create non public classes
      - discussions with teams: we will take care and review our code properly -> start of the end; will be violated when Deadlines come close!
- interesting comparison of the code organization methods in fig34.8 on p307
- other decoupling modi
  - use java 9 modules system todo check if this would solve the problem
  - use several Sourcecode trees for ports and Adapters approach -> other disadvantages
- The missing advice:
  - all best design decisions can be vanished very fast by the details of the Implementation strategy!
  - consider decouplibg during compile and runtime
  - be pragmatic considering budget, timelibe, team size and competence
  - let compiler check the compliance with your architecture style


### Afterword


### PART VII — Appendix

#### Appendix A — Archtitecture Archäologie
- interesting collection of Uncle Bob's projects and experience


