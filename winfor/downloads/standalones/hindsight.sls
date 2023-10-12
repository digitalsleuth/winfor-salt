# Name: Hindsight
# Website: https://github.com/obsidianforensics/hindsight
# Description: Web-based Chromium Browser artifact parser (Chrome origins)
# Category: Windows Analysis
# Author: Obsidian Forensics
# License: Apache v2.0 (https://github.com/obsidianforensics/hindsight/blob/master/LICENSE.md)
# Version: 2023.03
# Notes:

{% set version = '2023.03' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set files = [('hindsight.exe', 'b49787e3ba3ec57cb699798824f9b210558df8799afc66ddc1f340289eb027b0'),
                ('hindsight_gui.exe', '83e27d433763e781ac40d04021eb21a779e75a118ab0cee20e9fecaf0d82d417')] %}

{% for file, hash in files %}
hindsight-download-{{ file }}-only:
  file.managed:
    - name: '{{ downloads }}\hindsight\{{ version }}\{{ file }}'
    - source: https://github.com/obsidianforensics/hindsight/releases/download/v{{ version }}/{{ file }}
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True
{% endfor %}
