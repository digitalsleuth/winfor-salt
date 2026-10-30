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
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'ileapp-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\ileapp\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

ileapp-source-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\ileapp'
    - source: '{{ downloads }}\ileapp\{{ pkg }}'
    - enforce_toplevel: False

ileapp-archive-remove-offline:
  file.absent:
    - name: '{{ downloads }}\ileapp\{{ pkg }}'
    - require:
      - archive: ileapp-source-extract-offline

ileapp-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\ileapp\ileapp.exe -OutPath {{ inpath }}\shims\ileapp.exe'
    - require:
      - sls: winfor.config.shims

ileapp-gui-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\iLEAPP-GUI.lnk'
    - target: '{{ inpath }}\ileapp\ileapp.exe'
    - force: True
    - working_dir: '{{ inpath }}\ileapp\'
    - makedirs: True
    - require:
      - archive: ileapp-source-extract-offline
      - cmd: ileapp-shim-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
