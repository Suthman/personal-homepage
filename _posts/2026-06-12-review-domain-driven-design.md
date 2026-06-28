---
title: "Book Review: 'Domain-Driven Design kompakt' by Vaughn Vernon"    
excerpt: "My raw notes, key takeaways, and a structured summary of 'Domain-Driven Design kompakt'"
categories: 
  - blog
tags:
  - book-review
toc: true
toc_sticky: true
toc_label: "Domain-Driven Design"
toc_icon: "fa-solid fa-diagram-project"
header:
  overlay_image: /assets/images/2026-review-domain-driven-design/ddd_kompakt_title.jpg
  overlay_filter: 0.5 # Darkens the image (0.1 to 1.0) to keep the text readable
---

<style>
  .page__hero--overlay {
    background-size: contain !important; /* Fit the entire overlay image without cropping */
  }
</style>

{% include ai-disclaimer-short.html %}

This post is a book review as introduced in [Professional Book Review](/blog/started-book-reviews)

TODO: TODO BEARBEITEN - SUMMARY NEU GENERIEREN - TAGS VERGEBEN


## 📋 Quick Facts

- <img src="{{ '/assets/images/2026-review-domain-driven-design/ddd_distilled_title.jpg' | relative_url }}" alt="Domain-Driven Design Distilled" style="float: right; margin-left: 20px; margin-bottom: 20px; width: 75px; border-radius: 4px;">
**Book:** _Domain-Driven Design kompakt_   
German translation of [Domain-Driven Design Distilled](https://www.isbn.de/9780134434421) 
- **Author:** Vaughn Vernon   
translated from English by Carola Lilienthal and Henning Schwentner
- **Target Audience:** IT Architects / Software Developers
- **My Rating:** ⭐⭐⭐⭐⭐ (5/5) - Highly Recommended / Must Read
- **Link:** [Domain-Driven Design kompakt](https://dpunkt.de/produkt/domain-driven-design-kompakt/) or [ISBN: 9783864904394](https://www.isbn.de/9783864904394)


> **Quick Verdict:** This (German) book serves as the perfect entry point into Domain-Driven Design, as its practical concepts like Event Storming can be applied immediately to untangle complex legacy systems. It proved so highly effective in my own work that it transformed how I approach software design and eventually led me to teach DDD fundamentals to others.



## 💡 My Key Takeaways & Actions

I read the book some years ago and re-read it for this review. At the time, it was my first encounter with the "wonderful world of DDD." I immediately organized and facilitated several Event Storming sessions with my team back then to rediscover how an old legacy application functioned and to begin the work on replacing it. The whole thing worked so well that I have applied a lot of Domain-Driven Design since then—and have even given foundational training courses on it.

* **Event Storming**: The sticky-note method enables genuine cross-functionality across teams.
* **Distributed architecture**: Establishes a distributed business and domain model.
* **No monolithic model**: Finally eliminates the need for a single, all-encompassing model (such as a global glossary or universal technical data model).
* **System interactions**: Only two core interactions between systems exist:
  1. Publishing Domain Events.
  2. Accepting Commands.
* **Interaction patterns**: Organizational and technical interaction patterns are highly sophisticated and provide an excellent selection of strategies.
* **Strategic categorization**: Core, Supporting, and Generic Domains offer a valuable classification framework to determine where to invest the most effort.
* **Bounded Context definition**: I do not agree with the statement that "a Bounded Context is code only."   
It must also encompass: 
  * Documentation, or at least the definition of its single responsibility.
  * Test cases with acceptance criteria.



## 🔍 The Deep Dive (Summary)
{% include book-review-disclaimer.html %}



## 📝 Appendix: Raw Reading Notes
{% include book-review-disclaimer.html %}


### 1 DDD for Me
{: .no_toc}
- **Strategic**: helps focus on the right things.
- **Tactical**: designs good solutions by refining the strategic design.
- **Focus**: on processes instead of data models and technology.
- **"No design"**: does not exist; it is simply bad design.
- **Goal**: achieve effective design, which is not free but pays off quickly. Design requires knowledge, and its acquisition is never free.
- **DDD**: is cross-functional; domain experts, management, and all roles in the software development process should participate and contribute.

### 2 Strategic Design with Bounded Contexts and the Ubiquitous Language
{: .no_toc}
- **Contextual boundary**: each component inside has a clear meaning and performs defined actions.
- **Ubiquitous Language (UL)**: it is spoken and implemented within this specific context. The UL must be precise and clear.
- **Core Domain**: if a Bounded Context represents the heart of the enterprise strategy, it is called the Core Domain.
- **Relationships**: Teams to Bounded Contexts = 1:N (a single Bounded Context is never worked on by several teams).
- **Big Ball of Mud**: contexts that are too large result in a Big Ball of Mud architectural anti-pattern.
- **Stakeholder inclusion**: consider business stakeholders and domain experts from all relevant organizational areas and fields of expertise. 
- **Context-dependent concepts**: An individual insurance policy often carries distinct meanings, attributes, and events depending on the specific domain context. For instance, its definition and characteristics vary significantly across the **_Underwriting_**, **_Claims Management**, and **_Asset Valuation_** contexts.
- **Strategic design**: you must design your Bounded Context strategically. Only accept concepts that lie within the defined Bounded Context boundaries; others stay outside (and may form other Bounded Contexts)..
- **Business focus**: do **not** focus on technical complexity in DDD; focus entirely on business and domain aspects.
- **Defining the Ubiquitous Language**: write texts that describe the contexts. Do not rely on nouns alone. Note that this is just a way to communicate; scenario texts are not a permanent part of the Bounded Context codebase.
- **Scenarios**: these can be understood as acceptance criteria and formulated using the [Given-When-Then](https://en.wikipedia.org/wiki/Given-When-Then) approach.
- **Architecture**: Pages 40-42 outline the fundamental architectural patterns applicable to Domain-Driven Design (DDD)

### 3 Strategic Design with Subdomains
{: .no_toc}
- **Subdomain**: a part of the entire enterprise's business domain. Usually, we can only consider subdomains because full business domains are too large and complex. 
- **Alternative view**: an area of expertise where specific domain experts are available.
- **Realization**: a subdomain should be realized by exactly one Bounded Context.
- **Types of subdomains**: Core Domain, Supporting Domain, and Generic Domain.
- **Legacy systems**: subdomains can be used to analyze and discuss legacy systems. A monolith often embodies a Big Ball of Mud. Subdomains can help modularize them, at least from a logical point of view, which may aid in modernization.


### 4 Strategic Design with Context Mapping
{: .no_toc}
- **Context mapping**: when several Bounded Contexts interact, they require a translation of the affected parts of the two Ubiquitous Languages.
- **Integration**: defines the boundaries and types of integration, considering both technical and organizational aspects:
  - Partnership
  - Shared Kernel
  - Customer-Supplier
  - Conformist
  - Anticorruption Layer
  - Open Host Service
  - Published Language
  - Separate Ways
- **Recommendation**: protect your Bounded Context from "Big Ball of Mud" legacy systems using an Anticorruption Layer (ACL).
- **Using Context Mappings**:
  - **Direct calls**: utilizes Remote Procedure Calls (RPC) or REST/HTTP.
  - **Open-Host Service (OHS)**: the provider should use an Open-Host Protocol combined with a Published Language.
    - **Consumer ACL**: the consumer should apply an ACL against this Published Language.
    - **Interface design**: interfaces should be aligned with client needs, not internal Aggregate structures!
  - **Messaging for Domain Events**:
    - **Event definition**: the sender should define events using a Published Language.
    - **Idempotency**: the receiver must be idempotent to handle duplicate messages safely.
    - **Guaranteed delivery**: the message delivery mechanism should guarantee at-least-once delivery.
    - **Trade-off**: balancing "narrow" (thin) Domain Events paired with a "wide" (rich) query API versus providing "wide" (fat) Domain Events containing all data.


### 5 Tactical Design with Aggregates
{: .no_toc}
- **Aggregate**: consists of at least one Entity, where one Entity acts as the Aggregate Root. It can also contain Value Objects. Use **nouns** for aggregate names.
- **Entity**: a unique thing with a unique identity. It usually changes its value (e.g., state) over time, but it does not have to. The critical factor is its unique identity!
- **Value Object**: models a conceptually complete concept. It represents a value and is often used to describe, quantify, or measure Entities.
- **Transactional boundary**: each Aggregate creates a transactional boundary. All parts must be consistent with all business rules when being persisted (e.g., committed).
- **Boundary definition**: the transaction boundary is defined by the domain context and not the technical context!
- **Single transaction**: only one Aggregate should be committed within a single transaction.
- **Rules of thumb for Aggregates**: Apply the following rules to model aggregates. Their anwendung is explained on pages 79-84:
  - Protect business invariants within aggregate boundaries
  - Design small aggregates (and follow the [Single-Responsibility Principle (SRP)](https://en.wikipedia.org/wiki/Single-responsibility_principle))
  - Reference other aggregates only by their identity
  - Update other aggregates using eventual consistency
- **Communication**: Domain Events are ideal for communicating Aggregate changes. Use messaging for this.
- **Anemic Domain Model**: avoid anemic domain models in object-oriented setups, where all Aggregates have public getters and setters without real business logic.  
Note: Anemic domain models are normal in functional programming. The concepts are still applicable, but some guidelines change.
- **Abstractions**: avoid too many abstractions. The Ubiquitous Language must be aligned with the business domain and follow the mental model of the business experts!
- **Tips for rightsizing Aggregates**:
  - Crucial: Work with domain experts to identify acceptable eventual consistency update times. Avoid making everything "immediate." Eventual consistency is business-driven, not technically driven.
  - A nice example is elaborated on pages 92-94.
- **Testability**: well-designed Aggregates are highly testable due to their isolated transactional nature and adherence to the Single Responsibility Principle (SRP).


### 6 Tactical Design with Domain Events
{: .no_toc}
- **Domain Event**: The embodiment of a business-relevant occurrence within a Bounded Context. Use the **past participle** for domain event names, e.g., "Loading finished".
- **Causal consistency**: ensures that causally related operations appear in the exact same order from the perspective of dependent nodes in a distributed system.   
**Definition**: A business domain exhibits **_causal consistency_** if its causally related operations — where one operation triggers another — appear in the exact same order from the perspective of every dependent node within a distributed system
- **Realization**: causal consistency can be achieved by creating and consuming Domain Events in the correct order.
- **Triggers**: a Domain Event is often the result of a command. Other Domain Events can also be the cause of a Domain Event (e.g., the expiration of a timer).
- **Command**: an instruction or action (usually triggered by a user) executed on an Aggregate that triggers a Domain Event. Use the **imperative** for command names, e.g. "load truck"
- **Receiver responsibility**: The receiver is responsible for recognizing the correct causality of events. Page 104 lists several exemplary methods by which a consumer can ensure the causal consistency of domain events.
- **Commands vs. Events**: commands can be rejected as unexecutable. Domain Events cannot be rejected, as they represent a historical fact that has already occurred.
- **Event Sourcing**:
  - **Store**: stores all Domain Events that have been created for a specific Aggregate instance. This sequence of Domain Events is called an event stream.
  - **State reconstruction**: the event stream is sufficient to fully recreate the state of an Aggregate instance in memory!
  - **Performance**: optimize by applying snapshotting and caching techniques.
  - **CQRS**: event sourcing usually requires [Command Query Responsibility Segregation (CQRS)](https://en.wikipedia.org/wiki/Command_Query_Responsibility_Segregation) since an event store is highly inefficient for complex queries.
    - **Write**: Store the event stream in the event store.
    - **Read**: Prepare denormalized event projections via asynchronous background jobs.



### 7 Accelarating and Management Techniques 
{: .no_toc}
- **Knowledge acquisition**: learning and understanding a business requires time. A common but misguided impulse is to completely get rid of the design phase.
- **Event Storming**:
  - **Goal**: rapid knowledge acquisition.
  - **Shared learning**: every participant will learn something new about the domain.
  - **Sticky-note method**: anyone who can handle a sticky note can actively participate.
- **Other methods**:
  - High-level specifications utilizing the [Given-When-Then](https://en.wikipedia.org/wiki/Given-When-Then) approach and clear acceptance criteria.
  - Impact mapping.
  - User Story mapping.
- **Project Management**:
  - Use SWOT analysis to prioritize your work, especially when planning "modeling spikes."
  - Create architectural templates or baselines for every component type (Event, Aggregate, Command, etc.). Cross-reference these with rough estimations (e.g., \(X\) hours for low complexity, \(Y\) hours for medium complexity).
  - Always plan time-boxed modeling sessions to continuously improve knowledge acquisition.   
  Note: The domain expert must also have dedicated time for this!

### Glossary
{: .no_toc}

| Term | Description |
| :--- | :--- |
| **Aggregate** | Transactional consistency boundary clustering associated Entities and Value Objects. |
| **Aggregate Root** | The root of the Aggregate. Components of the Aggregate may only be accessed from the outside through this specific Entity. |
| **Anemic Domain Model** | Anti-pattern - A domain model where all Aggregates only have public getters and setters and contain no actual business logic. |
| **Anticorruption Layer** | A translation layer built by a team to protect its Ubiquitous Language and model from the influences of the Ubiquitous Language and model of another Bounded Context. |
| **Big Ball of Mud** | Anti-pattern - A software system that features multiple entangled models without clear boundaries. |
| **Bounded Context** | A semantic boundary within which the elements of the software model have a specific, consistent meaning. |
| **Building Blocks** | Elements used in tactical design to construct the domain model: Aggregate, Entity, Value Object, Domain Event, Module. |
| **Command** | An instruction or action (usually triggered by a user) executed on an Aggregate that triggers a Domain Event. |
| **Conformist** | A relationship where a downstream team completely adapts to the model of an upstream team. |
| **Context Map** | A visual map or diagram illustrating the relationship and integration of Bounded Contexts. |
| **Context Mapping** | The process of integrating two Bounded Contexts. |
| **Core Domain** | A subdomain in which the company aims to excel in order to differentiate itself from competitors in the market. |
| **Customer-Supplier** | A relationship where a downstream team (Customer) depends on an upstream team (Supplier), and the Supplier responds to the Customer's requests. |
| **Domain Event** | An immutable representation of a business-relevant occurrence. |
| **Domain Expert** | A person who possesses a deep understanding of the domain and its processes. |
| **Entity** | An individual object or concept from the domain. It always possesses an identity and usually has a mutable state. |
| **Generic Subdomain** | A subdomain necessary for business success but one where the company does not differentiate itself from others. Off-the-shelf solutions are often purchased for this. |
| **Module** | A programming language mechanism used to separate models or sub-models. Technically, a package or namespace. |
| **Open Host Service** | Defines a protocol or interface that provides access to a Bounded Context via a set of services. |
| **Partnership** | A relationship between two teams that can only achieve success together. |
| **Published Language** | A well-documented language for information exchange that enables simple consumption by any number of Bounded Contexts. |
| **Separate Ways** | A situation in which it is not worth the effort to integrate two Bounded Contexts. |
| **Shared Kernel** | A relationship between two teams that share a small, common model. |
| **Subdomain** | A subset of the enterprise-wide business domain. A mechanism to better understand the problem space. A subject area requiring specialized expertise. |
| **Supporting Domain** | A subdomain without which the Core Domain cannot succeed, but where excellence is not required. Custom software is necessary because no standard solution exists. |
| **Ubiquitous Language** | A common language shared by software developers and Domain Experts. It is spoken by team members and implemented directly within the software model. |
| **Value Object** | A value that is immutable and has no identity. Equivalence is determined by comparing its attributes. |
