# Name: Hindsight
# Website: https://github.com/obsidianforensics/hindsight
# Description: Web-based Chromium Browser artifact parser (Chrome origins)
# Category: Windows Analysis
# Author: Obsidian Forensics
# License: Apache v2.0 (https://github.com/obsidianforensics/hindsight/blob/master/LICENSE.md)
# Version: 2026.06
# Notes:

{% set version = '2026.06' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set files = [('hindsight.exe', '69beaaec4f29ea36734ca9115e6c002fc43ed918d860794e1641d3ac9f129bd7'),
                ('hindsight_gui.exe', 'ec78e8098b9fd898c0b426ada440138d471604a05760e12f90db83f15f44d49a')] %}

include:
  - winfor.config.shims

{% for file, hash in files %}

hindsight-download-{{ file }}:
  file.managed:
    - name: '{{ inpath }}\hindsight\{{ file }}'
    - source: https://github.com/obsidianforensics/hindsight/releases/download/v{{ version }}/{{ file }}
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True

hindsight-shim-{{ file }}:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\hindsight\{{ file }} -OutPath {{ inpath }}\shims\{{ file }}'
    - require:
      - sls: winfor.config.shims

{% endfor %}

standalones-hindsight-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Hindsight GUI.lnk'
    - target: {{ inpath }}\hindsight\hindsight_gui.exe
    - force: True
    - working_dir: {{ inpath }}\hindsight\
    - makedirs: True
    - require:
      - file: hindsight-download-hindsight_gui.exe
