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
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'vleapp-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\vleapp\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

vleapp-source-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\vleapp'
    - source: '{{ downloads }}\vleapp\{{ pkg }}'
    - enforce_toplevel: False

vleapp-archive-remove-offline:
  file.absent:
    - name: '{{ downloads }}\vleapp\{{ pkg }}'
    - require:
      - archive: vleapp-source-extract-offline

vleapp-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\vleapp\vleapp.exe -OutPath {{ inpath }}\shims\vleapp.exe'
    - require:
      - sls: winfor.config.shims

vleapp-gui-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\VLEAPP-GUI.lnk'
    - target: '{{ inpath }}\vleapp\vleapp.exe'
    - force: True
    - working_dir: '{{ inpath }}\vleapp\'
    - makedirs: True
    - require:
      - archive: vleapp-source-extract-offline
      - cmd: vleapp-shim-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
