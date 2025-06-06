# Name: OneDriveExplorer
# Website: https://github.com/Beercow/OneDriveExplorer
# Description: Command-line and GUI tool for viewing OneDrive folder structure
# Category: Windows Analysis
# Author: Brian Maloney
# License: MIT License (https://github.com/Beercow/OneDriveExplorer/blob/master/LICENSE)
# Version: 2025.05.30
# Notes:

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '2025.05.30' %}
{% set hash = '08dffab933ca9033c76f26a4f407311736d5f50dcb365e0673c3e27b39f0e5fd' %}

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

standalones-onedriveexplorer-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\onedriveexplorer\'

standalones-onedriveexplorer-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\OneDriveExplorer-GUI.lnk'
    - target: '{{ inpath }}\onedriveexplorer\OneDriveExplorer_GUI.exe'
    - force: True
    - working_dir: '{{ inpath }}\onedriveexplorer\'
    - makedirs: True
    - require:
      - archive: standalones-onedriveexplorer-extract
