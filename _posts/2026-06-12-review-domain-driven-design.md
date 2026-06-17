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

### 1 DDD for Me


### 2 Strategic Design with Bounded Contexts and the Ubiquitous Language


### 3 Strategic Design with Subdomains


### 4 Strategic Design with Context Mapping


### 5 Tactical Design with Aggregates


### 6 Tactical Design with Domain Events


### 7 Accelerating and Management Techniques




## 📝 Appendix: Raw Reading Notes


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
- **Stakeholder inclusion**: consider business stakeholders and domain experts from all relevant organizational areas and fields of expertise. Note that it is totally fine to have the same word with different exact meanings in different Bounded Contexts if your domain requires it. [TODO: Add policy example from page 19 / TODO: Determine how to handle figures].
- **Strategic design**: you must design your Bounded Context strategically. Only accept concepts that lie within the defined Bounded Context boundaries; others stay outside (and may form other Bounded Contexts)..
- **Business focus**: do **not** focus on technical complexity in DDD; focus entirely on business and domain aspects.
- **Defining the Ubiquitous Language**: write texts that describe the contexts. Do not rely on nouns alone. Note that this is just a way to communicate; scenario texts are not a permanent part of the Bounded Context codebase.
- **Scenarios**: these can be understood as acceptance criteria and formulated using the "Given/When/Then" approach. [TODO: Check everything into a specifications repository? Specification-Driven Development]
- [TODO: Analyze architectural impacts from page 41]

### 3 Strategic Design with Subdomains
{: .no_toc}
- **Subdomain**: a part of the entire enterprise's business domain. Usually, we can only consider subdomains because full business domains are too large and complex. 
- **Alternative view**: an area of expertise where specific domain experts are available.
- **Realization**: a subdomain should be realized by exactly one Bounded Context. Here, a Bounded Context is considered code only. [TODO: I do not agree. Discuss later.]
- **Types of subdomains**: Core Domain, Supporting Domain, and Generic Domain. [TODO: Add picture from DDD Knowledge Hub?]
- **Legacy systems**: subdomains can be used to analyze and discuss legacy systems. A monolith often embodies a Big Ball of Mud. Subdomains can help modularize them, at least from a logical point of view, which may aid in modernization. [TODO: From Monolith to Moduliths]


### 4 Strategic Design with Context Mapping
{: .no_toc}
- **Context mapping**: when several Bounded Contexts interact, they require a translation of the affected parts of the two Ubiquitous Languages. [TODO: Copy all definitions from the glossary.]
- **Integration**: defines the boundaries and types of integration, considering both technical and organizational aspects.
- [TODO: Mention relationship types from page 52 onwards.]
- **Recommendation**: protect your Bounded Context from "Big Ball of Mud" legacy systems using an Anti-Corruption Layer (ACL).
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
- **Aggregate**: consists of at least one Entity, where one Entity acts as the Aggregate Root. It can also contain Value Objects.
- **Entity**: a unique thing with a unique identity. It usually changes its value (e.g., state) over time, but it does not have to. The critical factor is its unique identity!
- **Value Object**: models a conceptually complete concept. It represents a value and is often used to describe, quantify, or measure Entities.
- **Transactional boundary**: each Aggregate creates a transactional boundary. All parts must be consistent with all business rules when being persisted (e.g., committed).
- **Boundary definition**: the transaction boundary is defined by the domain context and not the technical context!
- **Single transaction**: only one Aggregate should be committed within a single transaction.
- **Rules of thumb for Aggregates**: [TODO: Copy from page 79 / Rule 2: Should follow the Single Responsibility Principle (p. 81)] -> [See example on pages 79 onwards.]
- **Communication**: Domain Events are ideal for communicating Aggregate changes. Use messaging for this.
- **Anemic Domain Model**: avoid anemic domain models in object-oriented setups, where all Aggregates have public getters and setters without real business logic.  
Note: Anemic domain models are normal in functional programming. The concepts are still applicable, but some guidelines change.
- **Abstractions**: avoid too many abstractions. The Ubiquitous Language must be aligned with the business domain and follow the mental model of the business experts!
- **Tips for creating the right Aggregates**: [TODO: Reference page 92.]
  - Crucial: Work with domain experts to identify acceptable eventual consistency update times. Avoid making everything "immediate." Eventual consistency is business-driven, not technically driven. [TODO: Is this similar to SLAs/SLOs?]
- **Testability**: well-designed Aggregates are highly testable due to their isolated transactional nature and adherence to the Single Responsibility Principle (SRP).


### 6 Tactical Design with Domain Events
{: .no_toc}
- **Domain Event**: the embodiment of a business-relevant event within a Bounded Context.
- **Causal consistency**: ensures that causally related operations appear in the exact same order from the perspective of dependent nodes in a distributed system. [TODO: Check reference and definition on pages 97–98.]
- **Realization**: causal consistency can be achieved by creating and consuming Domain Events in the correct order.
- [TODO: Define naming conventions here and everywhere else.]
- **Triggers**: a Domain Event is often the result of a command. Other Domain Events can also be the cause of a Domain Event (e.g., the expiration of a timer).[TODO: Define Command.]
- **Receiver responsibility**: the receiver is responsible for recognizing the correct causality of events! [TODO: Investigate further: There are numerous possibilities: meta-attributes like versions, or relying on infrastructure like Kafka partition keys?!]
- **Commands vs. Events**: commands can be rejected as unexecutable. Domain Events cannot be rejected, as they represent a historical fact that has already occurred.
- **Event Sourcing**:
  - **Storage**: stores all Domain Events that have been created for a specific Aggregate instance. This sequence of Domain Events is called an event stream.
  - **State reconstruction**: the event stream is sufficient to fully recreate the state of an Aggregate instance in memory!
  - **Performance**: optimize by applying snapshotting and caching techniques.
  - **CQRS**: usually requires Command Query Responsibility Segregation (CQRS). [TODO: Elaborate on this relationship.]


### 7 Accelarating and Management Techniques 
{: .no_toc}
- **Knowledge acquisition**: learning and understanding a business requires time. A common but misguided impulse is to completely get rid of the design phase.
- **Event Storming**:
  - **Goal**: rapid knowledge acquisition.
  - **Shared learning**: every participant will learn something new about the domain.
  - **Sticky-note method**: anyone who can handle a sticky note can actively participate.
- **Other methods**:
  - High-level specifications utilizing the "Given/When/Then" approach and clear acceptance criteria.
  - Impact mapping.
  - User Story mapping.
- **Project Management**:
  - Use SWOT analysis to prioritize your work, especially when planning "modeling spikes."
  - Create architectural templates or baselines for every component type (Event, Aggregate, Command, etc.). Cross-reference these with rough estimations (e.g., \(X\) hours for low complexity, \(Y\) hours for medium complexity).
  - Always plan time-boxed modeling sessions to continuously improve knowledge acquisition.   
  Note: The domain expert must also have dedicated time for this!

