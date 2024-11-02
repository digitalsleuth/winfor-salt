# Name: WLEAPP
# Website: https://github.com/abrignoni/wleapp
# Description: Windows Logs Events and Properties Parser
# Category: Windows Analysis
# Author: Alexis Brignoni
# License: MIT License (https://github.com/abrignoni/WLEAPP/blob/main/LICENSE)
# Version: 0.1
# Notes: 

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

include:
  - winfor.packages.python3
  - winfor.packages.git

python3-wleapp-source:
  git.latest:
    - name: https://github.com/abrignoni/wleapp
    - target: '{{ inpath }}\wleapp'
    - rev: main
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git

python3-wleapp-patch-requirements:
  file.line:
    - name: '{{ inpath }}\wleapp\requirements.txt'
    - mode: delete
    - content: "packaging==20.1"
    - require:
      - git: python3-wleapp-source

python3-wleapp-requirements:
  pip.installed:
    - requirements: '{{ inpath }}\wleapp\requirements.txt'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - git: python3-wleapp-source
      - sls: winfor.packages.python3
      - file: python3-wleapp-patch-requirements

python3-wleapp-header:
  file.prepend:
    - names:
      - '{{ inpath }}\wleapp\wleapp.py'
      - '{{ inpath }}\wleapp\wleappGUI.py'
    - text: '#!/usr/bin/python3'
    - require:
      - git: python3-wleapp-source
      - pip: python3-wleapp-requirements

python3-wleapp-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\wleapp\'

python3-wleapp-icon:
  file.managed:
    - name: '{{ inpath }}\wleapp\abrignoni-logo.ico'
    - source: salt://winfor/files/abrignoni-logo.ico
    - skip_verify: True
    - makedirs: True

python3-wleapp-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\WLEAPP-GUI.lnk'
    - target: '{{ inpath }}\wleapp\wleappGUI.py'
    - force: True
    - working_dir: '{{ inpath }}\wleapp\'
    - icon_location: '{{ inpath }}\wleapp\abrignoni-logo.ico'
    - makedirs: True
    - require:
      - git: python3-wleapp-source
      - pip: python3-wleapp-requirements
      - file: python3-wleapp-header
      - win_path: python3-wleapp-env-vars
      - file: python3-wleapp-icon
