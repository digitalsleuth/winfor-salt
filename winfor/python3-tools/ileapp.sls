# Name: ILEAPP
# Website: https://github.com/abrignoni/ileapp
# Description: iOS Logs Events and Plists Parser
# Category: Mobile Analysis
# Author: Alexis Brignoni
# License: MIT License (https://github.com/abrignoni/iLEAPP/blob/main/LICENSE)
# Version: 1.18.1
# Notes: 

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

include:
  - winfor.packages.python3
  - winfor.packages.git
  - winfor.packages.ms-vcpp-2015-build-tools

winfor-python3-ileapp-source:
  git.latest:
    - name: https://github.com/abrignoni/ileapp
    - target: '{{ inpath }}\ileapp'
    - rev: main
    - force_clone: True
    - force_reset: True
    - force_fetch: True
    - require:
      - sls: winfor.packages.git

winfor-python3-ileapp-requirements:
  pip.installed:
    - requirements: '{{ inpath }}\ileapp\requirements.txt'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - git: winfor-python3-ileapp-source
      - sls: winfor.packages.python3
      - sls: winfor.packages.ms-vcpp-2015-build-tools

winfor-python3-ileapp-header:
  file.prepend:
    - names:
      - '{{ inpath }}\ileapp\ileapp.py'
      - '{{ inpath }}\ileapp\ileappGUI.py'
    - text: '#!/usr/bin/python3'
    - require:
      - git: winfor-python3-ileapp-source
      - pip: winfor-python3-ileapp-requirements

winfor-python3-ileapp-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\ileapp\'

winfor-python3-ileapp-icon:
  file.managed:
    - name: '{{ inpath }}\ileapp\abrignoni-logo.ico'
    - source: salt://winfor/files/abrignoni-logo.ico
    - source_hash: sha256=97ca171e939a3e4a3e51f4a66a46569ffc604ef9bb388f0aec7a8bceef943b98
    - makedirs: True

winfor-python3-ileapp-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ILEAPP-GUI.lnk'
    - target: '{{ inpath }}\ileapp\ileappGUI.py'
    - force: True
    - working_dir: '{{ inpath }}\ileapp\'
    - icon_location: '{{ inpath }}\ileapp\abrignoni-logo.ico'
    - makedirs: True
    - require:
      - git: winfor-python3-ileapp-source
      - pip: winfor-python3-ileapp-requirements
      - file: winfor-python3-ileapp-header
      - win_path: winfor-python3-ileapp-env-vars
      - file: winfor-python3-ileapp-icon
