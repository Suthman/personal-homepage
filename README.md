# Personal Homepage

This repository contains the source code of my personal homepage.  
- [Contents and Overview](#-contents-and-overview)
- [Technical setup](#-technical-setup)
- [TODOs and future topics](exclude/possible-content.md)


---


## 📖 Contents and overview
- [Home](_pages/home.md)
- [About me](_pages/about-me.md)
- [Publications](_pages/publications.md)
- [Legal](_pages/legal.md)
- [404](_pages/404.md)
- Blog / Posts
  - [2026-03-15-creating-my-website.md](_posts/2026-03-15-creating-my-website.md) `last_modified_at=2026-03-15 00:00:00`  
    categories: `Blog`, tags: `website` `development`


---


## 🛠️ Technical setup

- [Jekyll Theme: Minimal Mistakes](#-jekyll-theme-minimal-mistakes)
- [Theme Overrides and Customization](#-theme-overrides-and-customization)
- [Build and Deployment](#-build-and-deployment)
- [Accessibility and Links](#-accessibility-and-important-links)


---


### 🧪 Jekyll theme: Minimal Mistakes

The website is based on the [Jekyll](https://jekyllrb.com/) theme **Minimal Mistakes**.

Useful resources related to Minimal Mistakes:

- [Minimal Mistakes Documentation](https://mmistakes.github.io/minimal-mistakes/)
- [Minimal Mistakes GitHub Pages Starter](https://github.com/mmistakes/mm-github-pages-starter)
- [Sample Content Repository](https://github.com/mmistakes/jekyll-sample-content/)

Important files:
- [_config.yml](_config.yml): - Jekyll configuration
- [navigation.yml](_data/navigation.yml): site navigation
- [Gemfile](Gemfile): dependeny management for Ruby  
  Find Ruby dependencies on [rubygems.org](https://rubygems.org/)


---


### ⚠️ Theme Overrides and Customization

The following files have been **overridden**. Please proceed with caution during theme updates!

- **[footer.html](_includes/footer.html)**  
   The footer now only displays the text defined in the `footer.extra_footer_content` parameter of _config.yml
- **[head.html](_includes/head.html)**  
   Loads `font-awesome/6.7.2` globally
- **[social-share.html](_includes/social-share.html)**  
   Customized sharing options
- **[main.scss](assets/css/main.scss)**  
   Main CSS file; the override imports the original theme styles and adds custom rules

Usage of customization hooks (no direct override):
- **[comments-providers/custom.html](_includes/comments-providers/custom.html)**  
   Enables post feedback via email

Custom extensions:
- **[ai-disclaimer-short.html](_includes/ai-disclaimer-short.html)**  
   A disclaimer for text generated with AI

---


### 🚀 Build and Deployment

- I follow the **GitHub Flow** branching strategy: a single long-lived `main` branch and short-lived feature branches for changes.
- The website is generated using GitHub action **[deploy-jekyll-site.yml](.github/workflows/deploy-jekyll-site.yml)**
  - The site is build on each push to any branch
  - It is deployed on any push to the `main` branch (production)
  - For testing, it can be deployed manually from feature branches  
    Note: the branch must be explicitly mention in environment `github-pages`
  - ⚠️ **Attention**: PDF and BIB lastmod timestamps in the sitemap are overwritten via a post-build hack ⚠️
- Dependencies of `Ruby` and `Github Actions`are managed with Dependabot **[.github/dependabot.yml](.github/dependabot.yml)**


---


### 🌐 Accessibility and important links

The website is available at:

- https://www.christoph-mies.de  
- https://suthman.github.io/personal-homepage/

Additional resources:

- [Sitemap](https://christoph-mies.de/sitemap.xml)
- [RSS Feed](https://christoph-mies.de/feed.xml)

Domain Configuration
#### A‑Records (root domain → GitHub Pages IPs)

- christoph-mies.de  → 185.199.108.153
- christoph-mies.de  → 185.199.109.153
- christoph-mies.de  → 185.199.110.153
- christoph-mies.de  → 185.199.111.153


#### CNAME (www → GitHub Pages)

- www.christoph-mies.de  → suthman.github.io

