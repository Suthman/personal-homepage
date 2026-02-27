# Personal Homepage

This repository contains the source code of my personal homepage.


## Accessibility

The website is available at:
- https://www.christoph-mies.de
- https://suthman.github.io/personal-homepage/


## Build and Deployment 
- The GitHub Page is generated from the branch 'main'
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

