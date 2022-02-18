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

winfor-python3-vleapp-source:
  git.latest:
    - name: https://github.com/abrignoni/vleapp
    - target: 'C:\standalone\vleapp'
    - rev: main
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git

winfor-python3-vleapp-requirements:
  pip.installed:
    - requirements: 'C:\standalone\vleapp\requirements.txt'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - git: winfor-python3-vleapp-source
      - sls: winfor.packages.python3

winfor-python3-vleapp-header:
  file.prepend:
    - names:
      - 'C:\standalone\vleapp\vleapp.py'
      - 'C:\standalone\vleapp\vleappGUI.py'
    - text: '#!/usr/bin/python3'
    - require:
      - git: winfor-python3-vleapp-source
      - pip: winfor-python3-vleapp-requirements

winfor-python3-vleapp-env-vars:
  win_path.exists:
    - name: 'C:\standalone\vleapp\'

winfor-python3-vleapp-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\VLEAPP-GUI.lnk'
    - target: 'C:\standalone\vleapp\vleappGUI.py'
    - force: True
    - working_dir: 'C:\standalone\vleapp\'
    - makedirs: True
    - require:
      - git: winfor-python3-vleapp-source
      - pip: winfor-python3-vleapp-requirements
      - file: winfor-python3-vleapp-header
      - win_path: winfor-python3-vleapp-env-vars
