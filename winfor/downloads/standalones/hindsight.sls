# Name: Hindsight
# Website: https://github.com/obsidianforensics/hindsight
# Description: Web-based Chromium Browser artifact parser (Chrome origins)
# Category: Windows Analysis
# Author: Obsidian Forensics
# License: Apache v2.0 (https://github.com/obsidianforensics/hindsight/blob/master/LICENSE.md)
# Version: 2026.06
# Notes:

{% set version = '2026.06' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set files = [('hindsight', '69beaaec4f29ea36734ca9115e6c002fc43ed918d860794e1641d3ac9f129bd7'),
                ('hindsight_gui', 'ec78e8098b9fd898c0b426ada440138d471604a05760e12f90db83f15f44d49a')] %}

{% for file, hash in files %}
hindsight-download-{{ file }}-only:
  file.managed:
    - name: '{{ downloads }}\hindsight\{{ file }}-{{ version }}.exe'
    - source: https://github.com/obsidianforensics/hindsight/releases/download/v{{ version }}/{{ file }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True
{% endfor %}
