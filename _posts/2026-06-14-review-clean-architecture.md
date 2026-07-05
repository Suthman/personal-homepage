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
- Strict definition of level: 
  > A level is defined by the distance from the system inputs and outputs.
- Architecture and options
  > A good software architect maximizes the number of decisions not yet made.


## 🔍 The Deep Dive (Summary)
{% include book-review-disclaimer.html %}


## 📝 Appendix: Raw Reading Notes
{% include book-review-reading-notes.html %}


### PART I — Introduction

#### Chapter 1 — What is Design and Architecture?
- **Equivalence of concepts**: Software design and software architecture represent identical concepts.
- **Primary Architectural objective** (see page 30): 
> The objective of software architecture is to minimize the human resources required to build and maintain the required system.
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
- **Structured Programming Paradigm**: The paradigm of structured programming.
  - > Structured programming imposes disciplined control over direct transfer of control.
- **Object-Oriented Programming**: Object-oriented programming concepts.
  - > Object-oriented programming imposes disciplined control over indirect transfer of control.
- **Functional Programming**: Functional programming concepts.
  - > Functional programming imposes disciplined control over variable assignment.


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
  - This technical capability directly enables the implementation of the Inversion of Control (IoC) paradigm, representing a critical architectural value. TODO VERWEIS
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
- > Define a module in this context as being responsible to one single actor.
- **Misconception correction**: Do not assume every module must perform only a single task; this rule applies strictly to functions and methods, not to modules.
- **Original definition**: Maintain the original definition stating that there should be only one reason to change a module.
- **Future architectural mappings**: Anticipate that this concept will reappear in subsequent architectural layers as the Common Closure Principle (CCP) and the axis-of-change model. TODO VERWEISE

#### Chapter 8 — OCP: The Open-Closed Principle
- > A software entity must be open for extension but simultaneously closed to modification.
- **Architectural motivation**: Recognize this principle as the fundamental motivation driving software architecture.
- **Core methodology**: 
  - Decompose the system into distinct components and establish a suitable dependency hierarchy, ensuring higher-level components are protected from changes in lower-level components.
  - Note that excellent illustrative examples are provided within the book.

#### Chapter 9 — LSP: The Liskov Substitution Principle
- **Formal Liskov Substitution Principle definition**: 
> The objective is to achieve a substitution property where if, for each object `o1` of type `S`, there exists an object `o2` of type `T` such that for all programs `P` defined in terms of `T`, the behavior of `P` remains unchanged when `o1` is substituted for `o2`, then `S` is a subtype of `T`.
- **Historical context and scope expansion**: The principle was originally developed to handle inheritance in programming languages, but it should be viewed more generally to encompass all types of interfaces and components.
- **Architectural impact of violations**: A single violation can have a massive impact on maintainability, as numerous exceptions must subsequently be added, maintained, and understood.


#### Chapter 10 ISP: The Interface Segregation Principle
- **Interface specialization**: Design distinct interfaces tailored to specific architectural purposes.
- **Historical origin**: The concept was originally defined for statically linked programming languages.
- **Component generalization**: The principle successfully generalizes to all categories of software components.
- **General formulation**: Avoid relying on modules that provide a broader scope of functionality than required.
- **Component cohesion link**: This concept correlates directly with the Common Reuse Principle detailed in Chapter 13. TODO LINK


#### Chapter 11 — DIP: The Dependency Inversion Principle
- **Abstraction enforcement**: Source code dependencies must strictly consist of abstractions, a constraint that is historically challenging to implement.
- **Dependency isolation**: It remains entirely feasible to isolate concrete dependencies by utilizing factory components.
- **Platform exemptions**: Operating system components and core platform entities, such as the Java `String` class, are typically exempted from this architectural rule.
- **Stable abstraction constraints**: Architectural stability requires adhering to strict rules regarding concrete implementation structures.
  - Do not reference concrete classes.
  - Do not inherit from concrete classes.
  - Do not override concrete methods.
  - Do not explicitly reference concrete elements by name under any circumstances.
- **Abstract Factory integration**: Implement the [abstract factory pattern](https://en.wikipedia.org/wiki/Abstract_factory_pattern) to manage dependency creation cleanly.
  - A definitive illustrative diagram of this pattern is available on page 110.
  - Framework mechanisms, such as the Spring (Boot) application context, fully automate this specific instantiation workflow.



### PART IV — Component Principles

#### Chapter 12 — Components
- > Components represent the smallest deployable units within an architecture, exemplified by formats such as JAR files.
- **Deployment evolution**: A historical review of compilers and linkers demonstrates that modern plug-in architectures—utilizing artifacts like JARs and DLLs—have become the industry standard.


#### Chapter 13 — Component Cohesion
- **REP: Reuse-Release-Equivalence Principle**
  - > The granularity of reuse is the granularity of the release.
  - You can only reuse what is in one named component with the same version number, release documentation, etc.
- **CCP: Common-Closure Principle**
  - > Group classes that are modified for the same reasons and at the same time into the same components. Conversely, separate classes that are modified for different reasons and at different times into different components.
  - There should only be one reason to change a module.
  - This is a generalization of the Single-Responsibility Principle (SRP).
  - It is also related to the Open-Closed Principle (OCP): "Closed for modifications" cannot be reached completely. CCP requires this on a "higher component level."
  - Generalization of SRP and OCP: Group all elements that are modified for the same reasons and at the same time. Conversely, separate all elements that are modified for different reasons and at different times.
- **CRP: Common-Reuse Principle**
  - > Do not force the users of a component to depend on elements that they do not require.
  - Put components together that are usually used together.
  - Separate classes that are usually not used together.
  - It relates to the Interface Segregation Principle (ISP): ISP requires separating interfaces when methods are usually not used together.
  - Common denominator of ISP and CRP: Do not create dependencies on elements that you do not require.
- **The Tension Triad of Component Principles**
  - The 3 principles are in opposition.
  - REP tends to create big components to reduce their number.
  - CRP tends to create small components to reduce non-needed dependencies.
  - CCP organizes the components from a maintenance effort point of view.
  - The optimal component definition may change over time and project affordances. A tension diagram is on page 126.


#### Chapter 14 — Component Coupling
- **ADP: Acyclic-Dependencies Principle**
  - > Allow no cycles in the component dependency graph.
  - Violations result in complex integration management and impact analyses.
  - Overcome cycles by applying the Dependency Inversion Principle (DIP) or by creating a new component.
- **Top-Down Design Pitfalls**
  - Top-down design is not recommended because there is not enough knowledge upfront.
  - Component design is controlled by the Single-Responsibility Principle (SRP) and the Common-Closure Principle (CCP).
- **SDP: Stable-Dependencies Principle**
  - > Dependencies should run in the direction of stability.
  - Stability of components is defined as the effort required to change the component.
  - Metrics for instability (`I`):
    - `Fan-in`: number of incoming dependencies.
    - `Fan-out`: number of outgoing dependencies.
    - `I = fan-out / (fan-out + fan-in)`
    - `I = 0` is maximally stable, `I = 1` is maximally unstable.
  - SDP states that the `I`-value of a component should be higher than the `I`-values of the components it depends upon.
  - Note: Not all components should be stable.
- **SAP: Stable-Abstractions Principle**
  - > A component should be as abstract as it is stable.
  - Common components should be stable but also accessible by many components; therefore, they should be abstract.
  - SAP states that the stability of a component should relate to its abstraction.
  - SAP and SDP combined represent a component-level equivalent of the Dependency Inversion Principle (DIP).
  - Metrics for abstraction (`A`) of components:
    - `N_c`: Number of classes in a component.
    - `N_a`: Number of abstract classes and interfaces in a component.
    - `A`: Degree of abstraction. `A = N_a / N_c`
    - `A=0` means no abstract classes, `A=1` means all classes are abstract.
- **The `I`/`A` Graph and Zones of Exclusion**
  - The `I`/`A` graph with zones of exclusion on page 145 depicts the following relationships:
  - Zone of Pain: Highly stable (many dependent components) and highly concrete (hard to change). Examples include database schemas and the Java `String` class.
  - Zone of Uselessness: Highly abstract classes that are not referenced by any other components.
  - Main Sequence: Represents the optimal balance between stability and abstraction.
  - Distance `D` from the Main Sequence: `D = |A + I - 1|`
  - This metric enables statistical analysis, such as:
    - Examining the normal distribution and analyzing components where `D` is greater than the standard deviation.
    - Monitoring the value of `D` for a specific component over time.


### Part V — Architecture

#### Chapter 15 — What is Architecture?
- **System Structure**: Provide a "form" or structure for software systems.
  - Components and their interactions form this structure.
- **Behavior Determination**: Note that system behavior is determined by functional requirements.
  - Supporting the required use cases is the primary objective.
- **Cost Minimization**: Goal is to minimize lifetime costs across multiple phases.
  - Development
  - Deployment
  - Operations
  - Maintenance
- **Option Management**: Create and maintain architectural options.
  - > A good software architect maximizes the number of decisions not yet made.
  - Separate policies (business logic) from details.
  - Examples of details include databases, web frameworks, and device specifics.


#### Chapter 16 — Independence
- **Operations Planning**: Defer decisions regarding operations as long as possible.
  - If the component structure is robust, concrete deployment and operational modes can be determined at a later stage.
- **Team Structure Alignment**: Consider team organization within component design by accounting for [Conway's law](https://en.wikipedia.org/wiki/Conway%27s_law).
  - > [O]rganizations which design systems (in the broad sense used here) are constrained to produce designs which are copies of the communication structures of these organizations.
- **Decoupling**: Implement architectural decoupling across multiple dimensions.
  - Decouple horizontal layers.
    - Adhere to the Single Responsibility Principle (SRP) and the Common Closure Principle (CCP).
    - Decouple implementation details (e.g., UI and database access) from core business rules.
  - Decouple vertical use cases.
    - For example, "Creating an order" is distinct from "Deleting an order."
  - This separation enables independent development and deployment.
- **Duplication Classification**: Differentiate between real duplication and accidental duplication.
  - Eliminate real duplication systematically.
  - Resist the urge to eliminate accidental duplication.
  - For example, similar-looking display outputs have a high probability of diverging in the future if they do not represent the same core concept.
- **Decoupling (again()**: Evaluate decoupling across different architectural levels.
  - Decoupling can occur at the source code, deployment, or service level.
  - Defer the selection of the specific level as long as possible.
  - Note that the most suitable decoupling level for a system may change over time.


#### Chapter 17 — Boundaries: Drawing Lines
- **Boundary Separation**: Draw lines to protect important components, such as business rules and policies, from implementation details.
- **Plugin Architecture**: Imagine these boundary lines as a plugin system.
  - You can plug in different GUIs or databases to your system as long as the business cases remain protected against these volatile details.
- **Architectural Principles**: Boundary lines represent a concrete application of the Dependency Inversion Principle (DIP) and the Stable Abstractions Principle (SAP).


#### Chapter 18 — Boundary Anatomy
- **Deployment Monoliths**: Contrast monolithic architectures with multi-deployment unit configurations regarding package boundaries.
  - These represent different methodology variations used to enforce component paradigms.
  - Modulith: A single deployment unit contains all logical components, meaning component paradigms remain highly valuable for isolation, testing, and structural simplicity.
  - Deployments: Each individual component is built and isolated as a separate deployment unit.
- **Runtime Execution Boundaries**: Define execution boundaries operating within a single physical runtime environment.
  - Threads: 
    - Distinct runtime execution paths operating within the exact same process space.
    - Thread communication features highly efficient data exchange via shared memory access.
  - Local Processes: 
    - Multiple component instances run on the same physical machine but inside isolated operating system processes.
    - Process communication relies on slower mechanisms via standard inter-process communication (IPC).
    - Each individual process can internally spawn and employ multiple threads if required.
- **Service Boundaries**: Establish architectural boundaries across distributed services.
  - Multiple components or instances are instantiated as independent services.
  - Service communication occurs via standard network protocols, which introduces latency and is relatively slow.
  - Each individual service can internally utilize local processes or threads if desired.
  - Services offer the flexibility to be deployed across completely different physical or virtual machines.


#### Chapter 19 — Policies and Level
- **Business Logic Classification**: Policies represent high-level business logic within the application core.
- **Architectural Level Definition**: Define the precise metric for an architectural "level" within a system.
  - Strict definition of level: 
  > A level is defined by the distance from the system inputs and outputs.
  - Components sharing the exact same relative distance from inputs or outputs should be grouped together on the same architectural level.
  - Note: The architectural case study spanning pages 196–198 explicitly applies the Single Responsibility Principle (SRP), Open-Closed Principle (OCP), Common Closure Principle (CCP), Dependency Inversion Principle (DIP), Stable Dependencies Principle (SDP), and Stable Abstractions Principle (SAP).


#### Chapter 20 — Business Rules
- **Critical Business Rules**: These represent policies or procedures that directly result in earning or saving business capital.
  - They would also be applied even if no computer systems were used.
- **Critical Business Data**: This refers to the data required to calculate or execute the critical business rules.
- **Entity**: An object within a computer system that represents a small portion of the critical business rules.
  - Developers should create a dedicated class for this and separate it completely from all other aspects of the system.
- **Application Use Cases**: These rules are not as puristic as critical business rules and represent application-specific business rules instead.
  - They are required to be handled specifically within an automated system.
  - For example, the contact data of a customer must be created before she can place an order.
  - Use cases orchestrate entities, but entities are not aware of the use cases. Use cases operate closer to the input and output mechanisms but remain strictly protected from system details.
- **Request and Response Models**: These models are required so that use cases can receive input and produce output.
  - However, these classes must remain entirely free of dependencies on frameworks or even on the entities themselves.
  - They will change over time for different reasons, and coupling them would violate both the Common Closure Principle (CCP) and the Single Responsibility Principle (SRP).


#### Chapter 21 — Screaming Architecture
- **Screaming Architecture**: An application's architecture should clearly broadcast its underlying purpose. Because application use cases are first-class citizens and represent the primary objective of the system, the architecture must prominently emphasize these use cases rather than the frameworks being utilized.
- **Frameworks as Details**: Software frameworks are merely technical tools rather than an overriding philosophy or way of life. They should be treated strictly as low-level implementation details.
- **Decoupled Unit Testing**: When use cases are kept completely free of framework dependencies, developers can easily apply lightweight unit tests to verify both application use cases and business entities in isolation.


#### Chapter 22 — The Clean Architecture
- **Architectures influencing clean architecture**
  - Three important influencing architectures:
    - [Hexagonal architecture](https://en.wikipedia.org/wiki/Hexagonal_architecture_(software)) (later frequently referred to as **_Ports and Adpaters_**)
    - DCI - [Data, Context and Interaction](https://en.wikipedia.org/wiki/Data,_context_and_interaction)
    - BCE - [Boundary Control Entity](https://en.wikipedia.org/wiki/Entity%E2%80%93control%E2%80%93boundary)
  - Common Architectural Characteristics: These structural designs share fundamental operational principles.
    - Usage of layers to separate distinct system aspects: At least one level for business rules and an additional level for user and system interfaces.
    - Comprehensive framework independence.
    - High testability.
    - Complete UI independence.
    - Complete database independence.
    - Independence from external agencies.
- **Clean Architecture Overview**: The schematic diagram illustrates the concentric layout of the architecture.
  ![Clean architecture overview](/assets/images/2026-review-clean-architecture/clean_architecture.jpg "Clean architecture overview")
- **Dependency Rule**: This central rule governs the direction of all source code dependencies.
  - Definition:
  > Source code dependencies must only point inward, toward higher-level policies.
  - Entities encapsulate enterprise-wide business rules, representing critical business logic.
    - The probability of structural change is low.
  - Use cases realize application-specific business rules.
    - Structural modifications here do not affect entities, meaning changes in the GUI or database have no impact on the core logic.
- **Interface Adapters**: This layer translates data between the format convenient for use cases and entities, and the format convenient for external components.
  - Goal: Adapt interfaces between entities and use cases on one side and external mechanisms like databases or web UIs on the other.
  - Maintain absolute independence from specific frameworks or concrete technologies.
- **Frameworks and Drivers**: This outermost layer contains concrete technological details and external tools.
  - Contains all technological implementations and configuration details.
  - Demonstrates the highest structural distance from the core business logic.
- **Layer Scalability**: The system permits structural modifications to the number of architectural circles.
  - Engineers can introduce additional layers if required, provided the dependency rule strictly holds.
- **Boundary Crossing**: Architectural boundaries are crossed by consistently applying the Dependency Inversion Principle (DIP).
  - Employ simple **_Data Transfer Objects (DTOs)_** to cross layer boundaries. Do not utilize entities or framework-specific types for communication.
- **Application Flow Reference**: Page 217 includes a concrete example demonstrating standard cross-boundary data flows.



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
- Service architecture?
  - usage of services is a deployment and runtime details, no architecture
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
    - no new concept; For PCs it exists longer than Windows
    - HAL must know hardware details
  - processor is a detail: firmware layer must protect rest of system from processor  specialities
- operating system is a detail
  - add operating system and OSAL (operating system abstraction layer)


### PART VI — Details

#### Chapter 30 — The Database Is a Detail
- data models are important, databases are a detail
- why is discussion so intense? Data is stored on hard drives, which are slow! A lot of effort is required to make it as fast as possible. But in the end is a database just a technology to store sata persistently

#### Chapter 31 — The Web Is a Detail
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
