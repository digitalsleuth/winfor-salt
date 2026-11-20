# Name: Hindsight
# Website: https://github.com/obsidianforensics/hindsight
# Description: Web-based Chromium Browser artifact parser (Chrome origins)
# Category: Windows Analysis
# Author: Obsidian Forensics
# License: Apache v2.0 (https://github.com/obsidianforensics/hindsight/blob/master/LICENSE.md)
# Version: 2026.11
# Notes:

{% set version = '2026.11' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set files = [('hindsight.exe', '2e407bda175ebe6d1daec740a9b24507dcfb4d6a40f47caf6b729b2824ad1135'),
                ('hindsight_gui.exe', '7b7667e4fab1d93cbdcc3c8bbdfd096096b805be7b8b550b88247e4b3d59f158')] %}

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
