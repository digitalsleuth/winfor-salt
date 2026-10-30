# Name: VLEAPP
# Website: https://github.com/abrignoni/vleapp
# Description: Vehicle Logs Events and Properties Parser
# Category: Mobile Analysis
# Author: Alexis Brignoni
# License: MIT License (https://github.com/abrignoni/VLEAPP/blob/main/LICENSE)
# Version: 2026.4.4
# Notes: 

# renovate: datasource=github-releases depName=abrignoni/VLEAPP
{% set version = '2026.4.4' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('vleapp') %}

include:
  - winfor.config.shims

vleapp-source:
  file.managed:
    - name: '{{ inpath }}\VLEAPP-{{ version }}.zip'
    - source: https://github.com/abrignoni/VLEAPP/releases/download/v{{ version }}/VLEAPP-{{ version }}-windows-x64-portable.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

vleapp-source-extract:
  archive.extracted:
    - name: '{{ inpath }}\vleapp'
    - source: '{{ inpath }}\VLEAPP-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: vleapp-source

vleapp-archive-remove:
  file.absent:
    - name: '{{ inpath }}\VLEAPP-{{ version }}.zip'
    - require:
      - archive: vleapp-source-extract

vleapp-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\vleapp\vleapp.exe -OutPath {{ inpath }}\shims\vleapp.exe'
    - require:
      - sls: winfor.config.shims

vleapp-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\VLEAPP-GUI.lnk'
    - target: '{{ inpath }}\vleapp\vleapp.exe'
    - force: True
    - working_dir: '{{ inpath }}\vleapp\'
    - makedirs: True
    - require:
      - file: vleapp-source
      - cmd: vleapp-shim
