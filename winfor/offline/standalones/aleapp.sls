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
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'aleapp-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\aleapp\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

aleapp-source-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\aleapp'
    - source: '{{ downloads }}\aleapp\{{ pkg }}'
    - enforce_toplevel: False

aleapp-archive-remove-offline:
  file.absent:
    - name: '{{ downloads }}\aleapp\{{ pkg }}'
    - require:
      - archive: aleapp-source-extract-offline

aleapp-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\aleapp\aleapp.exe -OutPath {{ inpath }}\shims\aleapp.exe'
    - require:
      - sls: winfor.config.shims

aleapp-gui-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ALEAPP-GUI.lnk'
    - target: '{{ inpath }}\aleapp\aleapp.exe'
    - force: True
    - working_dir: '{{ inpath }}\aleapp\'
    - makedirs: True
    - require:
      - archive: aleapp-source-extract-offline
      - cmd: aleapp-shim-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
