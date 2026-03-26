---
title: "Creating my website"
excerpt: "Why I chose GitHub Pages, Jekyll, and Minimal Mistakes to build my website"
categories:
  - Blog
tags:
  - website
  - development
toc: true
toc_sticky: true
toc_label: "Creating my website"
toc_icon: "gears"

---

## Why did I start my website?

I created this website because I wanted to have a personal presence on the internet. It gives me the opportunity to share more about myself — and especially about my work — than a traditional CV can convey.

I also wanted a place to present my scientific publications in a structured and accessible way.

Beyond that, I was looking for a space to write about IT architecture topics that are relevant across many systems: complex, widely shared challenges where I can express my perspective without revealing sensitive details about my concrete projects or day-to-day work.


## Selecting a suitable tech stack

After deciding to build my website, the next step was choosing the right tools for it. My requirements were clear:

I wanted to present my CV and publications, maintain a blog with a moderate posting frequency — perhaps one or two posts per month — and use a layout that looks clean and appealing. At the same time, the solution needed to be easy to maintain, both in everyday operation and when applying updates.


### Collecting requirements leads to the first candidate: GitHub Pages

As an IT architect, I began by gathering the requirements for selecting an appropriate tool.

I already had a small website that I had written directly in static HTML and hosted by a good friend of mine. While this setup worked, it also revealed several limitations. From that experience, I realized that:

- I wanted a higher level of abstraction and preferred writing Markdown instead of raw HTML, with the final website generated automatically.
- I wanted to update and deploy my content independently, without relying on anyone else.
- I wanted proper version control for all changes.
- The solution needed to be free of charge.

This led me to the following requirements:

1. clean and appealing layout
2. easy to maintain
3. write Markdown instead of HTML
4. independent change and deployment
5. version control
6. free of charge

Since I already had a [GitHub](https://github.com/) account, [GitHub Pages](https://docs.github.com/en/pages) quickly emerged as a strong candidate that met all these requirements.

GitHub Pages uses [Jekyll](https://jekyllrb.com/) to transform Markdown into a complete website. A wide range of themes is available, making it easy to build pages with a clean and appealing design.


### Verifying that GitHub Pages and Jekyll form a suitable tech stack

With this initial idea in mind, I conducted a brief evaluation.

Two key questions emerged:

1. Is Jekyll the right choice for generating the site?
2. Is GitHub the right platform for hosting a Jekyll-based page?

After some research, I arrived at the following answer to question (1): *Jekyll is still a solid choice.*

- Jekyll transforms Markdown into static HTML pages.
- It is quite old (first released in 2008), but it is mature and stable.
- It has a large ecosystem — for almost any problem, you can find a plugin, guide, or tutorial.
- Once configured, it runs reliably for years without breaking changes.
- Many themes exist to enable appealing layouts.
- Other frameworks may offer faster build times or more interactive layouts, but for my use case, Jekyll is more than sufficient.
- Jekyll is free of charge.

For question (2), my research led to a clear conclusion: *GitHub is a very convenient choice.*

- GitHub provides native Jekyll integration. I do not need to write any build scripts or GitHub Actions workflows to get my website running.
- Other providers also support Jekyll, which means choosing GitHub does not create vendor lock-in. Migrating my site to another provider — for example, [GitLab Pages](https://docs.gitlab.com/user/project/pages/) — would require only a modest amount of effort.


The combination of Jekyll and GitHub fulfills my requirements:

1. clean and appealing layout — ⚠️ depending on the right Jekyll theme
2. easy to maintain — ✅
3. write Markdown instead of HTML — ✅
4. independent change and deployment — ✅
5. version control — ✅
6. free of charge — ✅



## Starting to build the website with Jekyll and GitHub Pages


### Initial setup and configuration

My first steps were straightforward and followed the GitHub Pages documentation.

I began by creating an `index.md` file as the main page and configuring GitHub Pages to build directly from my main branch.

To use my own domain and set up the CNAME, I needed to:

- create A-records pointing my domain to the GitHub Pages IP addresses
- create a CNAME entry delegating my domain to the corresponding github.io address

After that, I added additional pages — *About Me*, *Publications*, and *Imprint, Disclaimer, and Privacy Policy* — and linked them together within the Markdown files.

Everything worked, but the design was extremely basic. On the other hand, I now had all my content stored as clean Markdown files, without any external dependencies — a solid foundation to build upon.



### Applying the Jekyll Theme *Minimal Mistakes*

To improve the design of my website, I began searching for a suitable theme and quickly discovered [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/).

Google’s AI describes *Minimal Mistakes* as follows (March 2026):

> “Minimal Mistakes is a true ‘workhorse’ among Jekyll themes. It is less intended for playful, highly visual lifestyle blogs and instead shines where structure, information, and depth of content are the main focus.”
{: .notice--info}

Microsoft Copilot summarizes it this way (March 2026):

> “Minimal Mistakes is perfect for websites that need to organize and present substantial content cleanly and readably, without the overhead of a full CMS such as WordPress.”
{: .notice--info}

Encouraged by these assessments, I began exploring the technical details of the theme.

The minimal starter repository for Minimal Mistakes — [mm-github-pages-starter](https://github.com/mmistakes/mm-github-pages-starter) — proved extremely helpful. By studying its structure and configuration, I was able to iteratively reorganize and improve my own website.

Along the way, I learned that Markdown pages typically begin with a `front matter` block — a concept used by most static site generators, including Jekyll.  A wide range of parameters is available to control layout, metadata, and behavior. Another essential component is the Jekyll configuration file, `_config.yml`.

By asking LLMs about the specific parameters used these configurations, I gained a solid understanding of how Minimal Mistakes works and how to tailor it to my needs.



### Gitflow and Staging
As a former software developer, I have always appreciated the concept of staging environments — the idea that every change destined for production should first be deployed to at least one production-like test environment. Applied to my website, this would mean deploying changes to a test site before updating the real one.

However, GitHub Pages’ simple integration does not natively support such a staging concept. It would be possible to approximate it by using two separate repositories:
- a **DEV** repository that publishes to a test URL, and 
- a **PROD** repository that deploys to the final domain. 

After successful testing in **DEV**, a GitHub Action could synchronize the latest changes to **PROD**.

However, I decided not to pursue this relatively complex setup and instead opted for a much simpler approach.

I follow the [GitHub Flow](https://docs.github.com/en/get-started/using-github/github-flow) branching strategy. GitHub Flow consists of a single permanent **main** branch and short-lived feature branches for changes:

- **main** represents the production state of my website and is a protected branch
  - It can only be modified through pull requests, requires a linear history, and does not allow bypassing these rules
  - Tags and releases are created from this branch
  - By default, GitHub Pages builds the site from this branch
- The short-lived feature branches represent the development state of my website
  - During active development and testing, the website is generated from these branches
  - I actively use rebasing and force-pushes on these branches to keep the history of the main branch clean and readable


## Conclusion

My use case was straightforward:

I wanted to present my CV and publications, maintain a blog with a moderate posting frequency — perhaps one or two posts per month — and use a layout that looks clean and appealing.

The combination of Jekyll, the Minimal Mistakes theme, and GitHub Pages meets all of my requirements:

1. clean and appealing layout — ✅
2. easy to maintain — ✅
3. write Markdown instead of HTML — ✅
4. independent change and deployment — ✅
5. version control — ✅
6. free of charge — ✅

By omitting an explicit staging concept, I can rely on the very simple and efficient GitHub Flow, which keeps my workflow lightweight while still maintaining structure and clarity.

