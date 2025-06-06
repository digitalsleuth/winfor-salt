# Name: VLEAPP
# Website: https://github.com/abrignoni/vleapp
# Description: Vehicle Logs Events and Properties Parser
# Category: Mobile Analysis
# Author: Alexis Brignoni
# License: MIT License (https://github.com/abrignoni/VLEAPP/blob/main/LICENSE)
# Version: 2.1.2
# Notes: 

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '2.1.2' %}

include:
  - winfor.packages.python3
  - winfor.packages.git

python3-vleapp-source:
  git.latest:
    - name: https://github.com/abrignoni/vleapp
    - target: '{{ inpath }}\vleapp'
    - rev: main
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git

python3-vleapp-patch-requirements:
  file.line:
    - name: '{{ inpath }}\vleapp\requirements.txt'
    - mode: delete
    - content: "packaging==20.1"
    - require:
      - git: python3-vleapp-source

python3-vleapp-requirements:
  pip.installed:
    - requirements: '{{ inpath }}\vleapp\requirements.txt'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - git: python3-vleapp-source
      - sls: winfor.packages.python3
      - file: python3-vleapp-patch-requirements

python3-vleapp-header:
  file.prepend:
    - names:
      - '{{ inpath }}\vleapp\vleapp.py'
      - '{{ inpath }}\vleapp\vleappGUI.py'
    - text: '#!/usr/bin/python3'
    - require:
      - git: python3-vleapp-source
      - pip: python3-vleapp-requirements

python3-vleapp-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\vleapp\'

python3-vleapp-icon:
  file.managed:
    - name: '{{ inpath }}\vleapp\abrignoni-logo.ico'
    - source: salt://winfor/files/abrignoni-logo.ico
    - skip_verify: True
    - makedirs: True

python3-vleapp-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\VLEAPP-GUI.lnk'
    - target: '{{ inpath }}\vleapp\vleappGUI.py'
    - force: True
    - working_dir: '{{ inpath }}\vleapp\'
    - icon_location: '{{ inpath }}\vleapp\abrignoni-logo.ico'
    - makedirs: True
    - require:
      - git: python3-vleapp-source
      - pip: python3-vleapp-requirements
      - file: python3-vleapp-header
      - win_path: python3-vleapp-env-vars
      - file: python3-vleapp-icon
