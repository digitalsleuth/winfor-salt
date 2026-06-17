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
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}


include:
  - winfor.offline.packages.python3
  - winfor.offline.packages.ms-vcpp-2015-build-tools

ileapp-move-folder-offline:
  file.rename:
    - name: '{{ inpath }}\ileapp'
    - source: '{{ downloads }}\ileapp'
    - makedirs: True
    - force: True

ileapp-requirements-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages -r requirements.txt'
    - cwd: '{{ inpath }}\ileapp\'
    - require:
      - sls: winfor.offline.packages.python3
      - file: ileapp-move-folder-offline
      - sls: winfor.offline.packages.ms-vcpp-2015-build-tools

ileapp-env-vars-offline:
  win_path.exists:
    - name: '{{ inpath }}\ileapp\'

ileapp-gui-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ileapp-GUI.lnk'
    - target: '{{ inpath }}\ileapp\ileappGUI.py'
    - force: True
    - working_dir: '{{ inpath }}\ileapp\'
    - icon_location: '{{ inpath }}\ileapp\ileapp.ico'
    - makedirs: True
    - require:
      - cmd: ileapp-requirements-install-offline
      - win_path: ileapp-env-vars-offline
