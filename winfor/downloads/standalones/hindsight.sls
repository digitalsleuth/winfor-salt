# Name: Hindsight
# Website: https://github.com/obsidianforensics/hindsight
# Description: Web-based Chromium Browser artifact parser (Chrome origins)
# Category: Windows Analysis
# Author: Obsidian Forensics
# License: Apache v2.0 (https://github.com/obsidianforensics/hindsight/blob/master/LICENSE.md)
# Version: 2026.11
# Notes:

{% set version = '2026.11' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set files = [('hindsight', '2e407bda175ebe6d1daec740a9b24507dcfb4d6a40f47caf6b729b2824ad1135'),
                ('hindsight_gui', '7b7667e4fab1d93cbdcc3c8bbdfd096096b805be7b8b550b88247e4b3d59f158')] %}

{% for file, hash in files %}
hindsight-download-{{ file }}-only:
  file.managed:
    - name: '{{ downloads }}\hindsight\{{ file }}-{{ version }}.exe'
    - source: https://github.com/obsidianforensics/hindsight/releases/download/v{{ version }}/{{ file }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True
{% endfor %}
