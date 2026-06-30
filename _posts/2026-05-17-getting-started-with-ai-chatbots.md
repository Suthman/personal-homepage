---
title: "Getting started with AI chatbots – Master your prompting skills"    
excerpt: "A beginner-friendly introduction to AI chatbots: Learn why your input matters and discover practical techniques to get better results instantly."
categories:
  - blog
tags:
  - ai-chatbots
  - generative-ai
  - prompt-engineering
  - prompting-techniques
  - productivity
toc: true
toc_sticky: true
toc_label: "Prompt Engineering"
toc_icon: "fa-solid fa-robot"
---

{% include ai-disclaimer-short.html %}


Artificial intelligence is currently surrounded by buzzwords like **_Generative AI_**, **_Agentic AI_**, **_Large Language Models (LLM)_**, and **_AI Chatbots_**. This blog post gives non-IT readers a simple introduction to what these terms mean and how to use the underlying technologies effectively.

The focus is on **_AI chatbots_** like [ChatGPT](https://chatgpt.com). The goal is to help you understand the basics, see how the technology works, and learn to use it productively.

After a brief example conversation with an AI chatbot, I discuss the key factor that separates chatbots from traditional web search: the **_prompt_** — the input you provide. Several practical prompting techniques are introduced, followed by a short summary.



## Chatting with an AI Chatbot – An example

An AI chatbot is a tool that allows users to have interactive conversations. The chatbot responds and remembers the entire context of the chat. To demonstrate, I asked Gemini (Google) the question, _"What are the differences between an AI chatbot and a standard web search?"_ and started the following conversation:

> **Me:** What are the differences between an AI chatbot and a standard web search?
>
> **Gemini (Google):** ...
>
> ---
>
> **Me:** In English please. And be more concise.
>
> **Gemini (Google):** The main difference lies in **how** information is delivered:
> - **Search Engines** (like Google) act as a **digital library catalog**. They provide a list of links to external websites. You do the work of clicking, reading, and synthesizing the information yourself.
> - **AI Chatbots** (like ChatGPT) act as a **personal assistant**. They process vast amounts of data to give you a direct, conversational answer. They synthesize information for you.
>
> ### Key Comparisons
> {: .no_toc}
>
> | Feature | Web Search | AI Chatbot |
> | :--- | :--- | :--- |
> | **Output** | A list of relevant **links** | A generated **summary** or answer |
> | **Interaction** | One-off queries; static | Conversational; remembers **context** |
> | **Strengths** | Real-time news, official sources | Explaining concepts, creative tasks |
> | **Weakness** | Can feel like "hunting" for info | May "hallucinate" (make things up) |
> 
> ### In short
> {: .no_toc}
> Search is for **finding** sources.  
> AI is for **understanding or creating** content.
>
> ---
>
> **Me:** When should I use what? Do the methods complement each other, or are they in competition?
>
> **Gemini (Google):** ...
>
> ---
>
> **Me:** please answer short and concise
>
> **Gemini (Google):** Here is the breakdown of when to use each and how they relate:
>
> ### When to Use What
> {: .no_toc}
> - **Web Search:** Use for **facts, navigation, and real-time data**. (e.g., "Flight status," "Official tax forms," or "Latest news").
> - **AI Chatbot:** Use for **explanation, synthesis, and creativity**. (e.g., "Summarize this article," "Write a workout plan," or "Explain a complex concept").
>
> ### Competition or Complement?
> {: .no_toc}
> - **They are complementary:** Search finds the **raw data**; AI helps you **process and apply it**.
> - **They are merging:** Modern tools (like Perplexity or Google AI Overviews) now combine both into a single "Search AI" experience.
>
> **Rule of thumb:** Search for **"Where is it?"** — AI for **"What does it mean?"**
>
> Would you like a **comparison** of a specific search query vs. an AI prompt?
>
> ---
>
> **Me:** yes
>
> **Gemini (Google):** Here is the comparison for the query: **"How do I change a mountain bike chain?"**
>
>| Feature | **Web Search** (e.g., Google) | **AI Chatbot** (e.g., ChatGPT) |
| :--- | :--- | :--- |
| **Output** | Links to **YouTube videos** and blogs. | A direct **step-by-step list**. |
| **Strength** | Visuals; you see the exact tools. | Interactive; ask for specific tool tips. |
| **Weakness** | You must scan multiple sites/ads. | No images; harder to visualize. |
>
>**Verdict:** Use **Search** for "Show me how" (visuals) and **AI** for "Explain the process" (text guide).



## Context is the key - Prompts are decisive

Looking at the exemplary chat above, it becomes clear that the chatbot is aware of the whole **_context_** of the chat. For example, it understood that my request for a _"short and concise"_ answer related to the previous question, which I did not need to repeat. Additionally, I advised it to answer in English when it answered in German. Thus, I clarified my requirements for and expectations of the AI chatbot during the chat itself — meaning I refined the chatbot's context.

The input provided to an AI chatbot is called a **_prompt_**. The better the prompt, the better the answers of the chatbot will be, since it has a clearer context about its task. Gemini gave examples of bad and good prompts itself:

>
> **Me:** please give examples for a good and bad prompt
>
> **Gemini (Google):** Here are examples of bad and good prompts to illustrate the difference in precision:
> ### Topic: Email Drafting
> {: .no_toc}
>
>-   **Bad Prompt:** "Write an email about a delay."  
>    _(Too vague: Who is the recipient? Why the delay? What tone?)_
>
>-   **Good Prompt:** "Write a professional email to my project manager. Explain that the analysis report will be delayed by two days because the data delivery is pending. Apologize for the inconvenience and provide the new deadline: Wednesday."  
>    _(Precise: Defines role, reason, tone, and specific details.)_
>

The process of generating good prompts — resulting in good answers — is also called **_prompt engineering_**.



## Prompt Engineering

As stated above, writing good prompts is important to raise the quality of the generated answers. You can think of an AI chatbot as a **highly motivated and fast-working intern**: They will do exactly what you ask them to do — so you must precisely formulate **what** you want them to do. The higher upfront investment in writing a detailed prompt (compared to a simple web search) pays off when the result meets your expectations and saves you from refining your search manually.



### Basics 

A good prompt consists of the following elements:

| # | Component | Definition | Example |
| :--- | :--- | :--- | :--- |
| **1** | **Role** | Who the AI should pretend to be. | _"Act as an experienced social media manager."_ |
| **2** | **Task** | What exactly the AI should do. | _"Write a LinkedIn post about the benefits of remote work."_ |
| **3** | **Context** | The background, goal, or target audience. | _"The post is for mid-sized company CEOs who are still skeptical about working from home."_ |
| **4** | **Constraints** | What the AI must avoid or specific limits. | _"Do not use clichés or corporate buzzwords. Maximum 150 words."_ |
| **5** | **Tone** | How the AI should sound. | _"The tone should be professional yet approachable and persuasive."_ |
| **6** | **Format** | How the final output should be organized. | _"Use short paragraphs and end the post with a question (Call to Action)."_ |

As stated above, the prompt should describe the exact result that you expect from the AI chatbot. All six components in the table are important to define before the AI generates its answer. Of course, you can iteratively refine your initial prompt to improve the output. However, the more information you provide upfront, the better the generated result will be.



### Chain-of-Thought Prompting

Chain-of-Thought (CoT) prompting is a highly effective technique to unlock an AI’s logical intelligence.

#### What is it?
{: .no_toc}
CoT prompting simply means asking the AI to **"think out loud"** and show its work before giving a final answer. Instead of jumping straight to a conclusion, the AI breaks a problem down into smaller, logical steps.

#### Why is it important?
{: .no_toc}
AI predicts text one word at a time; **its typing is its thinking**. By forcing the AI to write out its steps, you give it **"working memory."** This drastically reduces logical errors and hallucinations in math, coding, or complex reasoning. It also lets you see exactly where the AI's logic failed if it makes a mistake.

#### How to use it?
{: .no_toc}
You do not need complex code. Just add a simple trigger phrase to the end of your prompt:
-   _"Think step-by-step before answering."_
-   _"Explain your reasoning path."_

**Basic idea:** Treat the AI like a student. If you force it to show its work, it will get the answer right.



### Few-Shot Prompting

Few-Shot Prompting is the easiest way to teach an AI exactly how you want it to behave.

#### What is it?
{: .no_toc}
Few-Shot Prompting means providing **1 to 3 concrete examples** of the exact input and desired output within your prompt before asking your actual question. 

#### Why is it important?
{: .no_toc}
AI models are massive pattern-recognition engines. While written instructions can be misunderstood, examples cannot. Giving the AI a few **"shots"** (examples) instantly aligns its tone, length, style, and formatting constraints. It eliminates guesswork and prevents the AI from giving a generic response.

#### How to use it?
{: .no_toc}
Structure your prompt by showing the AI how to do the task first, then give it the new task:

-   Example 1: `Input: "Movie: Inception"`  
-> `Output: "Genre: Sci-Fi ; Rating: 9/10"`
-   Example 2: `Input: "Movie: The Lion King"`  
-> `Output: "Genre: Animation ; Rating: 8/10"`
- Actual: `Input: "Movie: Interstellar"`  -> AI will now automatically output the exact format: `"Genre: Sci-Fi ; Rating: 9/10"`

**Basic idea:** Don't just tell the AI what you want — show it. 



### Reflective Prompting 

Reflective Prompting is an excellent technique for transforming the AI from a fast responder into a deep, critical thinker.

#### What is it?
{: .no_toc}
Reflective Prompting means instructing the AI to **critique, evaluate, or double-check its own work** before delivering the final answer. You are essentially giving the AI an internal quality control filter.

#### Why is it important?
{: .no_toc}
Standard prompts are **"single-pass"** — the AI prints the first thoughts that fit its algorithm. Reflective prompting forces a **"second look."** This process catches factual errors, removes superficial ideas, and uncovers hidden biases. It elevates the AI's output from a basic, generic response to an expert-level analysis.

#### How to use it?
{: .no_toc}
You can build a reflection mechanism right into your prompt with a simple instruction:

_"Draft a solution for `<Task>`. Then, review your own draft from the perspective of a harsh critic, list two potential flaws, and rewrite the final response to fix those flaws."_

**Basic idea:** Treat the AI like a business partner. Don't accept its very first draft; ask it to review its own thinking for better quality.



### Role-Based Prompting 

Role-Based Prompting is the foundational technique used to anchor the AI’s perspective and mindset before it tackles a task. Note that assigning a role has already been introduced as part of a good prompt in the [Basics](#basics) section. 

#### What is it?
{: .no_toc}
Role-Based Prompting means telling the AI to **adopt a specific persona or expert identity** (e.g., a lawyer, an award-winning chef, or a software engineer) at the very beginning of your prompt. 

#### Why is it important?
{: .no_toc}
AI models contain a vast ocean of general knowledge. By assigning a role, you tell the AI to ignore irrelevant data and pull information from a specific **"expert folder."** This instantly adjusts the vocabulary, depth, perspective, and professionalism of the answer. It ensures the response sounds like a seasoned professional rather than a generic encyclopedia.

#### How to use it?
{: .no_toc}
Always start your prompt by clearly defining the identity, experience level, and goal of the persona:

_"Act as a Senior Financial Advisor with 15 years of experience in startup investments. Review this business proposal and highlight the top 3 financial risks."_

**Basic idea:** Before asking the AI to do something, tell it **who** it needs to be to do the job perfectly.



## AI Chatbots: A major leap forward – Don't miss the AI train!

In this blog post, I gave an introduction to **_AI chatbots_**. This technology is the latest breakthrough in **_Generative AI_** since AI chatbots can actually **create content**: the resulting text. 

Why is the generation of text such an important milestone?  
This is a real breakthrough because by being able to generate text, the AI can create input for other IT systems. When an AI chatbot is extended to call other systems, the system becomes classified as **_Agentic AI_**. Many modern AI chatbots function as agentic AI systems since they can execute web searches and analyze the results to answer the user's questions (e.g., Google's Gemini uses Google Search). 

This is highly important since the core knowledge of current AIs is contained within **_Large Language Models (LLMs)_** that have been trained on static training data. This data is never fully up-to-date, making web search a key feature for providing real-time answers.

Currently, generative agentic AI systems are being developed for nearly all imaginable areas where IT can be applied. Since computers can cope with text, anything that can be processed by computer systems can be optimized by generative agentic AI systems. This encompasses the generation of files (image, video, and sound files, but also Word documents or PowerPoint presentations) as well as the entire area of software development (programming codes are text files in the end).

Improving your prompting skills is a valuable investment in your own future — both in a business and a personal environment. The best part is: you can simply try out the techniques presented in this blog post right away.

If you think of an **AI chatbot as a fast-working and highly motivated intern**, the delivered results will be better the clearer you state **what** you expect. Thus, spending effort on defining these requirements and providing a **detailed prompt** will quickly pay off.

I recommend the following prompting techniques as a starting point for crafting effective prompts:

- **Chain-of-Thought Prompting**  
_"Instruct the AI to think out loud"_  
Basic idea: Treat the AI like a student. If you force it to show its work, it will get the answer right.
- **Few-Shot Prompting**  
_"Provide concrete examples to the AI"_  
Basic idea: Don’t just tell the AI what you want — show it.
- **Reflective Prompting**  
_"Instruct the AI to critique, evaluate, or double-check"_  
Basic idea: Treat the AI like a business partner. Don’t accept its very first draft; ask it to review its own thinking for better quality.
- **Role-Based Prompting**  
_"Instruct the AI adopt a specific persona or expert identity"_  
 Basic idea: Before asking the AI to do something, tell it who it needs to be to do the job perfectly.


