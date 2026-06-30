---
title: "New Format: Professional Book Review"    
excerpt: "Introducing a new series of structured book reviews to share key takeaways, deep dives, and raw reading notes from professional literature"
categories:
  - blog
tags:
  - book-review
  - productivity
  - prompt-engineering
toc: true
toc_sticky: true
toc_label: "Professional Book Review"
toc_icon: "fa-solid fa-book-open"
---

{% include ai-disclaimer-short.html %}

TODO: CHECK PROMPT

Welcome to a new chapter of this blog! I am excited to introduce a dedicated space for professional literature. 


## Why do I start posting book reviews?

Today, I am excited to introduce a new, specialized type of post to this space: the book review. Moving forward, my goal is to regularly present professional literature that I have personally read. Writing these reviews serves a threefold purpose. First, it allows me to keep summaries and key takeaways easily accessible for my own future reference. Second, knowing that I will summarize each book increases my mindfulness and focus while reading, ensuring a much deeper understanding of the material. And finally, it gives me a structured way to share my insights, practical takeaways, and experiences with all of you.



## How do I post book reviews?


When reading a professional book, I take detailed reading notes for myself. Based on these notes, I craft a structured book review using the format presented below.

{% include book-review-disclaimer.html %}



### 📋 Quick Facts

This section provides a quick overview of the reviewed book.

- **Book**
- **Author**
- **Target Audience** 
- **My Rating**   
- **Link** 

I rate each book on a 5-star scale:

| Rating | Score | Description |
| :--- | :---: | :--- |
| ⭐⭐⭐⭐⭐ | 5/5 | Highly Recommended / Must Read |
| ⭐⭐⭐⭐☆ | 4/5 | Recommended / High Value |
| ⭐⭐⭐☆☆ | 3/5 | Solid / Good for Fundamentals |
| ⭐⭐☆☆☆ | 2/5 | Situational / Only for Specific Niches |
| ⭐☆☆☆☆ | 1/5 | Not Recommended / Skip It |


### 💡 My Key Takeaways & Actions


This section contains my personal key takeaways as well as the concrete actions I plan to implement next.



### 🔍 The Deep Dive (Summary)

This section presents a structured summary of the book's core concepts.


### 📝 Appendix: Raw Reading Notes

The raw reading notes that I jotted down while reading the book are shared here.



## Prompts

Based on the best practices outlined in [Getting started with AI chatbots – Master your prompting skills](/blog/getting-started-with-ai-chatbots), I developed a series of structured prompts designed to streamline the creation of book reviews from raw reading notes.

- Fix and beautify my bullet points of the raw meeting notes
  
```markdown
- **Role**
  - Act as an experienced author of technical and IT research papers.
- **Tasks**
  - Fix spelling, punctuation, and grammatical errors within the raw meeting notes.
  - Equip each top-level bullet point (Level 1) with a concise, bold-printed heading.
  - Translate the entire content into professional English.
- **Context**
  - The source text is located immediately below the `----------` separator line.
  - The final output must be written entirely in English.
- **Constraints**
  - Maintain the exact structure of the original meeting notes, as they map directly to the book's outline.
  - If any part of the text is ambiguous, ask for clarification; do not guess the intent.
- **Tone**
  - The tone must be strictly professional, academic, and objective.
- **Format**
  - Provide the final output in Markdown format, delivering both the rendered preview and a clean markdown-copy-and-paste code block.

----------
```

- Create the summary based on the raw meeting notes

```markdown
- Role
  - Act as an experienced author of technical and IT research papers.
- Tasks
  - Create a summary of the book XXX from my raw meeting notes
  - Link to the book: XXX
  - keep links to other pages; do not leave links out
- Context
  - The source text is located immediately below the `----------` separator line.
  - The text should be in English
  - The summary should be a continuous text
- Constraint
  - The sections of my meeting notes correspond to the structure of the book and should also be the structure of the summary
  - if you do have any questions, then ask me; do not guess!
- Tone
  - your tone should be professional and objective
- Format
  - Provide answers in Markdown: render as well as a markdown-copy-and-paste block

----------
```

- When a text exceeds the maximum token length for a single prompt, it must be split across multiple inputs. Subsequent prompts can then be utilized to provide the remaining additional text.

```markdown
Here is the additional text. It is located immediately below the `----------` separator line.

----------
```

- Propose 3 - 5 tags for a blog post

```markdown
Propose 3 - 5 tags for the blog post. It is located immediately below the `----------` separator line.

----------
```