# Name: ALEAPP
# Website: https://github.com/abrignoni/aleapp
# Description: Android Logs Events and Protobuf Parser
# Category: Mobile Analysis
# Author: Alexis Brignoni
# License: MIT License (https://github.com/abrignoni/ALEAPP/blob/main/LICENSE)
# Version: 2026.4.4
# Notes: 

# renovate: datasource=github-releases depName=abrignoni/ALEAPP
{% set version = '2026.4.4' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('aleapp') %}

include:
  - winfor.config.shims

aleapp-source:
  file.managed:
    - name: '{{ inpath }}\ALEAPP-{{ version }}.zip'
    - source: https://github.com/abrignoni/ALEAPP/releases/download/v{{ version }}/ALEAPP-{{ version }}-windows-x64-portable.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

aleapp-source-extract:
  archive.extracted:
    - name: '{{ inpath }}\aleapp'
    - source: '{{ inpath }}\ALEAPP-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: aleapp-source

aleapp-archive-remove:
  file.absent:
    - name: '{{ inpath }}\ALEAPP-{{ version }}.zip'
    - require:
      - archive: aleapp-source-extract

aleapp-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\aleapp\aleapp.exe -OutPath {{ inpath }}\shims\aleapp.exe'
    - require:
      - sls: winfor.config.shims

aleapp-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ALEAPP-GUI.lnk'
    - target: '{{ inpath }}\aleapp\aleapp.exe'
    - force: True
    - working_dir: '{{ inpath }}\aleapp\'
    - makedirs: True
    - require:
      - file: aleapp-source
      - cmd: aleapp-shim
