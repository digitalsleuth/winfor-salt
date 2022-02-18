# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.python3
  - winfor.packages.git

winfor-python3-wleapp-source:
  git.latest:
    - name: https://github.com/abrignoni/wleapp
    - target: 'C:\standalone\wleapp'
    - rev: main
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git

winfor-python3-wleapp-requirements:
  pip.installed:
    - requirements: 'C:\standalone\wleapp\requirements.txt'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - git: winfor-python3-wleapp-source
      - sls: winfor.packages.python3

winfor-python3-wleapp-header:
  file.prepend:
    - names:
      - 'C:\standalone\wleapp\wleapp.py'
      - 'C:\standalone\wleapp\wleappGUI.py'
    - text: '#!/usr/bin/python3'
    - require:
      - git: winfor-python3-wleapp-source
      - pip: winfor-python3-wleapp-requirements

winfor-python3-wleapp-env-vars:
  win_path.exists:
    - name: 'C:\standalone\wleapp\'

winfor-python3-wleapp-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\WLEAPP-GUI.lnk'
    - target: 'C:\standalone\wleapp\wleappGUI.py'
    - force: True
    - working_dir: 'C:\standalone\wleapp\'
    - makedirs: True
    - require:
      - git: winfor-python3-wleapp-source
      - pip: winfor-python3-wleapp-requirements
      - file: winfor-python3-wleapp-header
      - win_path: winfor-python3-wleapp-env-vars

