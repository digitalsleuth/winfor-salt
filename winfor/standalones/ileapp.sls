# Name: ILEAPP
# Website: https://github.com/abrignoni/ileapp
# Description: iOS Logs Events and Plists Parser
# Category: Mobile Analysis
# Author: Alexis Brignoni
# License: MIT License (https://github.com/abrignoni/iLEAPP/blob/main/LICENSE)
# Version: 2026.4.5
# Notes: 

# renovate: datasource=github-releases depName=abrignoni/iLEAPP
{% set version = '2026.4.5' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('ileapp') %}

include:
  - winfor.config.shims

ileapp-source:
  file.managed:
    - name: '{{ inpath }}\iLEAPP-{{ version }}.zip'
    - source: https://github.com/abrignoni/iLEAPP/releases/download/v{{ version }}/iLEAPP-{{ version }}-windows-x64-portable.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

ileapp-source-extract:
  archive.extracted:
    - name: '{{ inpath }}\ileapp'
    - source: '{{ inpath }}\iLEAPP-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: ileapp-source

ileapp-archive-remove:
  file.absent:
    - name: '{{ inpath }}\iLEAPP-{{ version }}.zip'
    - require:
      - archive: ileapp-source-extract

ileapp-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\ileapp\ileapp.exe -OutPath {{ inpath }}\shims\ileapp.exe'
    - require:
      - sls: winfor.config.shims

ileapp-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\iLEAPP-GUI.lnk'
    - target: '{{ inpath }}\ileapp\ileapp.exe'
    - force: True
    - working_dir: '{{ inpath }}\ileapp\'
    - makedirs: True
    - require:
      - file: ileapp-source
      - cmd: ileapp-shim
