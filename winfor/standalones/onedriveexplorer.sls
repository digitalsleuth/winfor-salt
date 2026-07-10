# Name: OneDriveExplorer
# Website: https://github.com/Beercow/OneDriveExplorer
# Description: Command-line and GUI tool for viewing OneDrive folder structure
# Category: Windows Analysis
# Author: Brian Maloney
# License: MIT License (https://github.com/Beercow/OneDriveExplorer/blob/master/LICENSE)
# Version: 2026.06.29
# Notes:

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '2026.06.29' %}
{% set hash = '5560cb3cab51f1cf7b28d0a17c06e94854922302b4f7f09218b8a0a4d8abce63' %}

include:
  - winfor.config.shims

standalones-onedriveexplorer-source:
  file.managed:
    - name: 'C:\salt\tempdownload\ode.zip'
    - source: https://github.com/Beercow/OneDriveExplorer/releases/download/v{{ version }}/ODE.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

standalones-onedriveexplorer-extract:
  archive.extracted:
    - name: '{{ inpath }}\onedriveexplorer'
    - source: 'C:\salt\tempdownload\ode.zip'
    - enforce_toplevel: False
    - require:
      - file: standalones-onedriveexplorer-source

onedriveexplorer-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\onedriveexplorer\onedriveexplorer.exe -OutPath {{ inpath }}\shims\onedriveexplorer.exe'
    - require:
      - sls: winfor.config.shims

standalones-onedriveexplorer-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\OneDriveExplorer-GUI.lnk'
    - target: '{{ inpath }}\onedriveexplorer\OneDriveExplorer_GUI.exe'
    - force: True
    - working_dir: '{{ inpath }}\onedriveexplorer\'
    - makedirs: True
    - require:
      - archive: standalones-onedriveexplorer-extract
