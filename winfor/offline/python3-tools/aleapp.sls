# Name: ALEAPP
# Website: https://github.com/abrignoni/aleapp
# Description: Android Logs Events and Protobuf Parser
# Category: Mobile Analysis
# Author: Alexis Brignoni
# License: MIT License (https://github.com/abrignoni/ALEAPP/blob/main/LICENSE)
# Version: 3.4.0
# Notes: 

{% set version = '3.4.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}


include:
  - winfor.offline.packages.python3

aleapp-move-folder-offline:
  file.rename:
    - name: '{{ inpath }}\aleapp'
    - source: '{{ downloads }}\aleapp'
    - makedirs: True
    - force: True

aleapp-requirements-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages -r requirements.txt'
    - cwd: '{{ inpath }}\aleapp\'
    - require:
      - sls: winfor.offline.packages.python3
      - file: aleapp-move-folder-offline

aleapp-header-offline:
  file.prepend:
    - names:
      - '{{ inpath }}\aleapp\aleapp.py'
      - '{{ inpath }}\aleapp\aleappGUI.py'
    - text: '#!/usr/bin/python3'
    - require:
      - cmd: aleapp-requirements-install-offline

aleapp-env-vars-offline:
  win_path.exists:
    - name: '{{ inpath }}\aleapp\'

aleapp-gui-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ALEAPP-GUI.lnk'
    - target: '{{ inpath }}\aleapp\aleappGUI.py'
    - force: True
    - working_dir: '{{ inpath }}\aleapp\'
    - icon_location: '{{ inpath }}\aleapp\abrignoni-logo.ico'
    - makedirs: True
    - require:
      - cmd: aleapp-requirements-install-offline
      - file: aleapp-header-offline
      - win_path: aleapp-env-vars-offline
