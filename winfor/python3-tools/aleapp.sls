# Name: ALEAPP
# Website: https://github.com/abrignoni/aleapp
# Description: Android Logs Events and Protobuf Parser
# Category: Mobile Analysis
# Author: Alexis Brignoni
# License: MIT License (https://github.com/abrignoni/ALEAPP/blob/main/LICENSE)
# Version: 3.4.0
# Notes: 

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '3.4.0' %}

include:
  - winfor.packages.python3
  - winfor.packages.git

python3-aleapp-source:
  git.latest:
    - name: https://github.com/abrignoni/aleapp
    - target: '{{ inpath }}\aleapp'
    - rev: main
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git

python3-aleapp-patch-requirements:
  file.line:
    - name: '{{ inpath }}\aleapp\requirements.txt'
    - mode: delete
    - content: "packaging==20.1"
    - require:
      - git: python3-aleapp-source

python3-aleapp-requirements:
  pip.installed:
    - requirements: '{{ inpath }}\aleapp\requirements.txt'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - git: python3-aleapp-source
      - sls: winfor.packages.python3
      - file: python3-aleapp-patch-requirements

python3-aleapp-header:
  file.prepend:
    - names:
      - '{{ inpath }}\aleapp\aleapp.py'
      - '{{ inpath }}\aleapp\aleappGUI.py'
    - text: '#!/usr/bin/python3'
    - require:
      - git: python3-aleapp-source
      - pip: python3-aleapp-requirements

python3-aleapp-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\aleapp\'

python3-aleapp-icon:
  file.managed:
    - name: '{{ inpath }}\aleapp\abrignoni-logo.ico'
    - source: salt://winfor/files/abrignoni-logo.ico
    - skip_verify: True
    - makedirs: True

python3-aleapp-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ALEAPP-GUI.lnk'
    - target: '{{ inpath }}\aleapp\aleappGUI.py'
    - force: True
    - working_dir: '{{ inpath }}\aleapp\'
    - icon_location: '{{ inpath }}\aleapp\abrignoni-logo.ico'
    - makedirs: True
    - require:
      - git: python3-aleapp-source
      - pip: python3-aleapp-requirements
      - file: python3-aleapp-header
      - win_path: python3-aleapp-env-vars
      - file: python3-aleapp-icon
