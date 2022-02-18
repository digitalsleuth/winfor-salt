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

winfor-python3-aleapp-source:
  git.latest:
    - name: https://github.com/abrignoni/aleapp
    - target: 'C:\standalone\aleapp'
    - rev: master
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git

winfor-python3-aleapp-requirements:
  pip.installed:
    - requirements: 'C:\standalone\aleapp\requirements.txt'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - git: winfor-python3-aleapp-source
      - sls: winfor.packages.python3

winfor-python3-aleapp-header:
  file.prepend:
    - names:
      - 'C:\standalone\aleapp\aleapp.py'
      - 'C:\standalone\aleapp\aleappGUI.py'
    - text: '#!/usr/bin/python3'
    - require:
      - git: winfor-python3-aleapp-source
      - pip: winfor-python3-aleapp-requirements

winfor-python3-aleapp-env-vars:
  win_path.exists:
    - name: 'C:\standalone\aleapp\'

winfor-python3-aleapp-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ALEAPP-GUI.lnk'
    - target: 'C:\standalone\aleapp\aleappGUI.py'
    - force: True
    - working_dir: 'C:\standalone\aleapp\'
    - makedirs: True
    - require:
      - git: winfor-python3-aleapp-source
      - pip: winfor-python3-aleapp-requirements
      - file: winfor-python3-aleapp-header
      - win_path: winfor-python3-aleapp-env-vars
