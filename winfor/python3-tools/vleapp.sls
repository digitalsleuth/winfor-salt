# Name: VLEAPP
# Website: https://github.com/abrignoni/vleapp
# Description: Vehicle Logs Events and Properties Parser
# Category: Mobile Analysis
# Author: Alexis Brignoni
# License: MIT License (https://github.com/abrignoni/VLEAPP/blob/main/LICENSE)
# Version: 1.0.0
# Notes: 

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

include:
  - winfor.packages.python3
  - winfor.packages.git

winfor-python3-vleapp-source:
  git.latest:
    - name: https://github.com/abrignoni/vleapp
    - target: '{{ inpath }}\vleapp'
    - rev: main
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git

winfor-python3-vleapp-requirements:
  pip.installed:
    - requirements: '{{ inpath }}\vleapp\requirements.txt'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - git: winfor-python3-vleapp-source
      - sls: winfor.packages.python3

winfor-python3-vleapp-header:
  file.prepend:
    - names:
      - '{{ inpath }}\vleapp\vleapp.py'
      - '{{ inpath }}\vleapp\vleappGUI.py'
    - text: '#!/usr/bin/python3'
    - require:
      - git: winfor-python3-vleapp-source
      - pip: winfor-python3-vleapp-requirements

winfor-python3-vleapp-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\vleapp\'

winfor-python3-vleapp-icon:
  file.managed:
    - name: '{{ inpath }}\abrignoni-logo.ico'
    - source: salt://winfor/files/abrignoni-logo.ico
    - source_hash: sha256=97ca171e939a3e4a3e51f4a66a46569ffc604ef9bb388f0aec7a8bceef943b98
    - makedirs: True

winfor-python3-vleapp-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\VLEAPP-GUI.lnk'
    - target: '{{ inpath }}\vleapp\vleappGUI.py'
    - force: True
    - working_dir: '{{ inpath }}\vleapp\'
    - icon_location: '{{ inpath }}\abrignoni-logo.ico'
    - makedirs: True
    - require:
      - git: winfor-python3-vleapp-source
      - pip: winfor-python3-vleapp-requirements
      - file: winfor-python3-vleapp-header
      - win_path: winfor-python3-vleapp-env-vars
      - file: winfor-python3-vleapp-icon
