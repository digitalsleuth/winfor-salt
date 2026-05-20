# Name: ILEAPP
# Website: https://github.com/abrignoni/ileapp
# Description: iOS Logs Events and Plists Parser
# Category: Mobile Analysis
# Author: Alexis Brignoni
# License: MIT License (https://github.com/abrignoni/iLEAPP/blob/main/LICENSE)
# Version: 2.3.1
# Notes: 

{% set version = '2.3.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set hash = 'fe5d74d033b43533c7954195832c729cbf090177211f159299f6e499b6457a45' %}

include:
  - winfor.packages.python3
  - winfor.packages.ms-vcpp-2015-build-tools

ileapp-source:
  file.managed:
    - name: '{{ inpath }}\iLEAPP-{{ version }}.zip'
    - source: https://github.com/abrignoni/ileapp/archive/refs/tags/v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

ileapp-source-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ inpath }}\ileapp-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: ileapp-source

ileapp-folder-rename:
  file.rename:
    - name: '{{ inpath }}\ileapp'
    - source: '{{ inpath }}\iLEAPP-{{ version }}'
    - makedirs: True
    - force: True
    - require:
      - archive: ileapp-source-extract

ileapp-remove-archive:
  file.absent:
    - name: '{{ inpath }}\iLEAPP-{{ version }}.zip'
    - require:
      - file: ileapp-folder-rename

ileapp-requirements:
  pip.installed:
    - requirements: '{{ inpath }}\ileapp\requirements.txt'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - cwd: '{{ inpath }}\ileapp'
    - require:
      - file: ileapp-source
      - sls: winfor.packages.python3
      - sls: winfor.packages.ms-vcpp-2015-build-tools

ileapp-header:
  file.prepend:
    - names:
      - '{{ inpath }}\ileapp\ileapp.py'
      - '{{ inpath }}\ileapp\ileappGUI.py'
    - text: '#!/usr/bin/python3'
    - require:
      - file: ileapp-source
      - pip: ileapp-requirements

ileapp-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\ileapp\'

ileapp-icon:
  file.managed:
    - name: '{{ inpath }}\ileapp\ileapp.ico'
    - source: salt://winfor/files/ileapp.ico
    - skip_verify: True
    - makedirs: True

ileapp-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ILEAPP-GUI.lnk'
    - target: '{{ inpath }}\ileapp\ileappGUI.py'
    - force: True
    - working_dir: '{{ inpath }}\ileapp\'
    - icon_location: '{{ inpath }}\ileapp\ileapp.ico'
    - makedirs: True
    - require:
      - file: ileapp-source
      - pip: ileapp-requirements
      - file: ileapp-header
      - win_path: ileapp-env-vars
      - file: ileapp-icon
