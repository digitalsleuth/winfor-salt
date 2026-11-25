# Name: Obsidian
# Website: https://obsidian.md/
# Description: Note taking application
# Category: Utilities
# Author: Obsidian
# License: Free Use (https://obsidian.md/license)
# Version: 1.15.1
# Notes:

{% set version = '1.15.1' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('obsidian-md') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

obsidian-md-download-only:
  file.managed:
    - name: '{{ downloads }}\obsidian-md\obsidian-md-{{ version }}.exe'
    - source: https://github.com/obsidianmd/obsidian-releases/releases/download/v{{ version }}/Obsidian-{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
