# Name: ALEAPP
# Website: https://github.com/abrignoni/aleapp
# Description: Android Logs Events and Protobuf Parser
# Category: Mobile Analysis
# Author: Alexis Brignoni
# License: MIT License (https://github.com/abrignoni/ALEAPP/blob/main/LICENSE)
# Version: 3.4.1
# Notes: 

{% set version = '3.4.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set hash = '16516091fa560aeecc1f7e06509b863a448606055ddf66ac5355f2c2b28ded4a' %}

include:
  - winfor.packages.python3

aleapp-source:
  file.managed:
    - name: '{{ inpath }}\aleapp\ALEAPP-{{ version }}.zip'
    - source: https://github.com/abrignoni/ALEAPP/archive/refs/tags/v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

aleapp-source-extract:
  archive.extracted:
    - name: '{{ inpath }}\aleapp\'
    - source: '{{ inpath }}\aleapp\ALEAPP-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: aleapp-source

aleapp-patch-requirements:
  file.line:
    - name: '{{ inpath }}\aleapp\requirements.txt'
    - mode: delete
    - content: "packaging==20.1"
    - require:
      - file: aleapp-source
      - archive: aleapp-source-extract

aleapp-requirements:
  pip.installed:
    - requirements: '{{ inpath }}\aleapp\requirements.txt'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - git: aleapp-source
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
    - name: '{{ inpath }}\aleapp\abrignoni-logo.ico'
    - source: salt://winfor/files/abrignoni-logo.ico
    - skip_verify: True
    - makedirs: True

aleapp-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ALEAPP-GUI.lnk'
    - target: '{{ inpath }}\aleapp\aleappGUI.py'
    - force: True
    - working_dir: '{{ inpath }}\aleapp\'
    - icon_location: '{{ inpath }}\aleapp\abrignoni-logo.ico'
    - makedirs: True
    - require:
      - git: aleapp-source
      - pip: aleapp-requirements
      - file: aleapp-header
      - win_path: aleapp-env-vars
      - file: aleapp-icon
