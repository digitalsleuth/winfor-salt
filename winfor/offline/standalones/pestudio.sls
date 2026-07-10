# Name: PEStudio
# Website: https://www.winitor.com
# Description: PE Analysis Tool
# Category: Executables
# Author: Marc Ochsenmeier
# License: As-Is, without warranty (https://www.winitor.com/tools/pestudio/changes.log)
# Version: 9.61
# Notes: 

{% set version = '9.61' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'pestudio-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\pestudio\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

pestudio-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\pestudio\{{ pkg }}'
    - enforce_toplevel: False

pestudio-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\pestudio\pestudio.exe -OutPath {{ inpath }}\shims\pestudio.exe'
    - require:
      - sls: winfor.config.shims

pestudio-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\PEStudio.lnk'
    - target: '{{ inpath }}\pestudio\pestudio.exe'
    - force: True
    - working_dir: '{{ inpath }}\pestudio\'
    - makedirs: True
    - require:
      - archive: pestudio-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
