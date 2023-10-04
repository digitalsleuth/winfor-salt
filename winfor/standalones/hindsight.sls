# Name: Hindsight
# Website: https://github.com/obsidianforensics/hindsight
# Description: Web-based Chromium Browser artifact parser (Chrome origins)
# Category: Windows Analysis
# Author: Obsidian Forensics
# License: Apache v2.0 (https://github.com/obsidianforensics/hindsight/blob/master/LICENSE.md)
# Version: 2023.03
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set version = '2023.03' %}
{% set files = [('hindsight.exe', 'b49787e3ba3ec57cb699798824f9b210558df8799afc66ddc1f340289eb027b0'),
                ('hindsight_gui.exe', '83e27d433763e781ac40d04021eb21a779e75a118ab0cee20e9fecaf0d82d417')] %}

{% for file, hash in files %}
hindsight-download-{{ file }}:
  file.managed:
    - name: '{{ inpath }}\hindsight\{{ file }}'
    - source: https://github.com/obsidianforensics/hindsight/releases/download/v{{ version }}/{{ file }}
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True
{% endfor %}

hindsight-path:
  win_path.exists:
    - name: '{{ inpath }}\hindsight\'

standalones-hindsight-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Hindsight GUI.lnk'
    - target: {{ inpath }}\hindsight\hindsight_gui.exe
    - force: True
    - working_dir: {{ inpath }}\hindsight\
    - makedirs: True
    - require:
      - file: hindsight-download-hindsight_gui.exe
