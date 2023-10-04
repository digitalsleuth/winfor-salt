# Name: OneDriveExplorer
# Website: https://github.com/Beercow/OneDriveExplorer
# Description: Command-line and GUI tool for viewing OneDrive folder structure
# Category: Windows Analysis
# Author: Brian Maloney
# License: MIT License (https://github.com/Beercow/OneDriveExplorer/blob/master/LICENSE)
# Version: 2023.09.22
# Notes:

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '2023.09.22' %}
{% set hash = '88c1ed6aeff727a760cebbd4bdf20bd4db359bd7370b17bda75ce6ce304ef22d' %}

winfor-standalones-onedriveexplorer-source:
  file.managed:
    - name: 'C:\salt\tempdownload\ode.zip'
    - source: https://github.com/Beercow/OneDriveExplorer/releases/download/v{{ version }}/ode.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

winfor-standalones-onedriveexplorer-extract:
  archive.extracted:
    - name: '{{ inpath }}\onedriveexplorer'
    - source: 'C:\salt\tempdownload\ode.zip'
    - enforce_toplevel: False
    - require:
      - file: winfor-standalones-onedriveexplorer-source

winfor-standalones-onedriveexplorer-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\onedriveexplorer\'

winfor-standalones-onedriveexplorer-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\OneDriveExplorer-GUI.lnk'
    - target: '{{ inpath }}\onedriveexplorer\OneDriveExplorer_GUI.exe'
    - force: True
    - working_dir: '{{ inpath }}\onedriveexplorer\'
    - makedirs: True
    - require:
      - archive: winfor-standalones-onedriveexplorer-extract
