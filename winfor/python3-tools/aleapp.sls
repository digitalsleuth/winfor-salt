# Name: ALEAPP
# Website: https://github.com/abrignoni/aleapp
# Description: Android Logs Events and Protobuf Parser
# Category: Mobile Analysis
# Author: Alexis Brignoni
# License: MIT License (https://github.com/abrignoni/ALEAPP/blob/main/LICENSE)
# Version: 3.6.0
# Notes: 

{% set version = '3.6.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set hash = 'c71e624aeea0dd662911cc5677ef290edec0914a29af46a549942eb599e11bb2' %}

include:
  - winfor.packages.python3

aleapp-source:
  file.managed:
    - name: '{{ inpath }}\ALEAPP-{{ version }}.zip'
    - source: https://github.com/abrignoni/ALEAPP/archive/refs/tags/v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

aleapp-source-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ inpath }}\ALEAPP-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: aleapp-source

aleapp-folder-rename:
  file.rename:
    - name: '{{ inpath }}\aleapp'
    - source: '{{ inpath }}\ALEAPP-{{ version }}\'
    - makedirs: True
    - force: True
    - require:
      - archive: aleapp-source-extract

aleapp-archive-remove:
  file.absent:
    - name: '{{ inpath }}\ALEAPP-{{ version }}.zip'
    - require:
      - file: aleapp-folder-rename

aleapp-patch-requirements:
  file.line:
    - name: '{{ inpath }}\aleapp\requirements.txt'
    - mode: replace
    - match: "packaging==20.1"
    - content: "packaging==24.1"
    - require:
      - file: aleapp-source
      - archive: aleapp-source-extract

aleapp-requirements:
  pip.installed:
    - requirements: '{{ inpath }}\aleapp\requirements.txt'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - file: aleapp-source
      - sls: winfor.packages.python3
      - file: aleapp-patch-requirements

aleapp-header:
  file.prepend:
    - names:
      - '{{ inpath }}\aleapp\aleapp.py'
      - '{{ inpath }}\aleapp\aleappGUI.py'
    - text: '#!/usr/bin/python3'
    - require:
      - file: aleapp-source
      - pip: aleapp-requirements

aleapp-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\aleapp\'

aleapp-icon:
  file.managed:
    - name: '{{ inpath }}\aleapp\aleapp.ico'
    - source: salt://winfor/files/aleapp.ico
    - skip_verify: True
    - makedirs: True

aleapp-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ALEAPP-GUI.lnk'
    - target: '{{ inpath }}\aleapp\aleappGUI.py'
    - force: True
    - working_dir: '{{ inpath }}\aleapp\'
    - icon_location: '{{ inpath }}\aleapp\aleapp.ico'
    - makedirs: True
    - require:
      - file: aleapp-source
      - pip: aleapp-requirements
      - file: aleapp-header
      - win_path: aleapp-env-vars
      - file: aleapp-icon
