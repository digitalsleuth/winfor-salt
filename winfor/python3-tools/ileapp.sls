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

winfor-python3-ileapp-source:
  git.latest:
    - name: https://github.com/abrignoni/ileapp
    - target: 'C:\standalone\ileapp'
    - rev: master
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git

winfor-python3-ileapp-requirements:
  pip.installed:
    - requirements: 'C:\standalone\ileapp\requirements.txt'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - git: winfor-python3-ileapp-source
      - sls: winfor.packages.python3

winfor-python3-ileapp-header:
  file.prepend:
    - names:
      - 'C:\standalone\ileapp\ileapp.py'
      - 'C:\standalone\ileapp\ileappGUI.py'
    - text: '#!/usr/bin/python3'
    - require:
      - git: winfor-python3-ileapp-source
      - pip: winfor-python3-ileapp-requirements

winfor-python3-ileapp-env-vars:
  win_path.exists:
    - name: 'C:\standalone\ileapp\'

winfor-python3-ileapp-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ILEAPP-GUI.lnk'
    - target: 'C:\standalone\ileapp\ileappGUI.py'
    - force: True
    - working_dir: 'C:\standalone\ileapp\'
    - makedirs: True
    - require:
      - git: winfor-python3-ileapp-source
      - pip: winfor-python3-ileapp-requirements
      - file: winfor-python3-ileapp-header
      - win_path: winfor-python3-ileapp-env-vars
