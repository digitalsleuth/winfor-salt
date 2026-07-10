# Name: OneDriveExplorer
# Website: https://github.com/Beercow/OneDriveExplorer
# Description: Command-line and GUI tool for viewing OneDrive folder structure
# Category: Windows Analysis
# Author: Brian Maloney
# License: MIT License (https://github.com/Beercow/OneDriveExplorer/blob/master/LICENSE)
# Version: 2026.06.29
# Notes:

{% set version = '2026.06.29' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'onedriveexplorer-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\onedriveexplorer\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

onedriveexplorer-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\onedriveexplorer'
    - source: '{{ downloads }}\onedriveexplorer\{{ pkg }}'
    - enforce_toplevel: False

onedriveexplorer-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\onedriveexplorer\onedriveexplorer.exe -OutPath {{ inpath }}\shims\onedriveexplorer.exe'
    - require:
      - sls: winfor.config.shims

onedriveexplorer-gui-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\OneDriveExplorer-GUI.lnk'
    - target: '{{ inpath }}\onedriveexplorer\OneDriveExplorer_GUI.exe'
    - force: True
    - working_dir: '{{ inpath }}\onedriveexplorer\'
    - makedirs: True
    - require:
      - archive: onedriveexplorer-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
