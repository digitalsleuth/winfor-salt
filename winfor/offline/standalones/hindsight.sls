# Name: Hindsight
# Website: https://github.com/obsidianforensics/hindsight
# Description: Web-based Chromium Browser artifact parser (Chrome origins)
# Category: Windows Analysis
# Author: Obsidian Forensics
# License: Apache v2.0 (https://github.com/obsidianforensics/hindsight/blob/master/LICENSE.md)
# Version: 2026.01
# Notes:

{% set version = '2026.01' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set files = ['hindsight.exe','hindsight_gui.exe'] %}

include:
  - winfor.config.shims

{% for file in files %}
hindsight-{{ file }}-offline:
  file.managed:
    - name: '{{ inpath }}\hindsight\{{ file }}'
    - source: '{{ downloads }}\hindsight\{{ version }}\{{ file }}'
    - skip_verify: True
    - makedirs: True
    - replace: True

hindsight-shim-{{ file }}-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\hindsight\{{ file }} -OutPath {{ inpath }}\shims\{{ file }}'
    - require:
      - sls: winfor.config.shims

{% endfor %}

hindsight-gui-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Hindsight GUI.lnk'
    - target: {{ inpath }}\hindsight\hindsight_gui.exe
    - force: True
    - working_dir: {{ inpath }}\hindsight\
    - makedirs: True
    - require:
      - file: hindsight-hindsight_gui.exe-offline
