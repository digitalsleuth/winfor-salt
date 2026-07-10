# Name: VLEAPP
# Website: https://github.com/abrignoni/vleapp
# Description: Vehicle Logs Events and Properties Parser
# Category: Mobile Analysis
# Author: Alexis Brignoni
# License: MIT License (https://github.com/abrignoni/VLEAPP/blob/main/LICENSE)
# Version: 2.2.0
# Notes: 

{% set version = '2.2.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'vleapp.py' %}
{% set exists = salt['file.file_exists'](downloads + '\\vleapp\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3

vleapp-move-folder-offline:
  file.rename:
    - name: '{{ inpath }}\vleapp'
    - source: '{{ downloads }}\vleapp'
    - makedirs: True
    - force: True

vleapp-requirements-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages -r requirements.txt'
    - cwd: '{{ inpath }}\vleapp\'
    - require:
      - sls: winfor.offline.packages.python3
      - file: vleapp-move-folder-offline

vleapp-env-vars-offline:
  win_path.exists:
    - name: '{{ inpath }}\vleapp\'

vleapp-gui-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\VLEAPP-GUI.lnk'
    - target: '{{ inpath }}\vleapp\vleappGUI.py'
    - force: True
    - working_dir: '{{ inpath }}\vleapp\'
    - icon_location: '{{ inpath }}\vleapp\vleapp.ico'
    - makedirs: True
    - require:
      - cmd: vleapp-requirements-install-offline
      - win_path: vleapp-env-vars-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
