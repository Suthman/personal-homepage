# Personal Homepage

This repository contains the source code of my personal homepage.


## Accessibility

The website is available at:
- https://www.christoph-mies.de
- https://suthman.github.io/personal-homepage/


## Build and Deployment 
- I chose to follow the GitHub Flow branching strategy. GitHub Flow consists of a single permanent **main** branch and short-lived feature branches for changes.
- The GitHub Page is generated from the **main** branch by default (production setup). For testing purposes, it can temporarily be generated from short-lived branches as well. However, this should remain the exception.
- [Gemfile](Gemfile) is the Ruby configuration file required for [Jeckyll](https://jekyllrb.com/)
- Additionally, HTML files are generated with Jekyll by the github action job [jekyll.yml](.github/workflows/jekyll.yml)
  - HTML of 'main' branch are written to branch 'gh-pages'
  - HTML of other branches is written to branch 'gh-pages-dev'



## Configuration of domain
- Create four A-Records for your primary domain pointing to the GitHub IP adresses  
  - christoph-mies.de -> 185.199.108.153
  - christoph-mies.de -> 185.199.109.153
  - christoph-mies.de -> 185.199.110.153
  - christoph-mies.de -> 185.199.111.153
- Create a CNAME forwarding from the www-part to the github url 
  - www.christoph-mies.de -> suthman.github.io


## Important Files
- [index.md](index.md) — Main homepage content  
- [_config.yml](_config.yml) — Jekyll configuration file 

