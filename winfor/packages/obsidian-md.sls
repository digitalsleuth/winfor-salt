# Name: Obsidian
# Website: https://obsidian.md/
# Description: Note taking application
# Category: Utilities
# Author: Obsidian
# License: Free Use (https://obsidian.md/license)
# Version: 1.15.1
# Notes: 

# renovate: datasource=github-releases depName=obsidianmd/obsidian-releases
{% set version = '1.15.1' %}

obsidian-md:
  pkg.install

obsidian-icon-remove:
  file.absent:
    - name: 'C:\Users\Public\Desktop\Obsidian.lnk'
    - require:
      - pkg: obsidian-md
