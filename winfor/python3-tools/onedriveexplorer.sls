# Name: OneDriveExplorer
# Website: https://github.com/Beercow/OneDriveExplorer
# Description: Command-line and GUI tool for viewing OneDrive folder structure
# Category: Windows Analysis
# Author: Brian Maloney
# License: MIT License (https://github.com/Beercow/OneDriveExplorer/blob/master/LICENSE)
# Version: 2023.05.05
# Notes:

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

include:
  - winfor.packages.python3
  - winfor.packages.git

winfor-python3-onedriveexplorer-source:
  git.latest:
    - name: https://github.com/Beercow/OneDriveExplorer
    - target: '{{ inpath }}\onedriveexplorer'
    - rev: master
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git

winfor-python3-onedriveexplorer-requirements:
  pip.installed:
    - requirements: '{{ inpath }}\onedriveexplorer\OneDriveExplorer\requirements.txt'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - git: winfor-python3-onedriveexplorer-source
      - sls: winfor.packages.python3

winfor-python3-onedriveexplorer-header:
  file.prepend:
    - names:
      - '{{ inpath }}\onedriveexplorer\OneDriveExplorer\OneDriveExplorer.py'
      - '{{ inpath }}\onedriveexplorer\OneDriveExplorer\OneDriveExplorer_GUI.py'
    - text: '#!/usr/bin/python3'
    - require:
      - git: winfor-python3-onedriveexplorer-source
      - pip: winfor-python3-onedriveexplorer-requirements

winfor-python3-onedriveexplorer-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\onedriveexplorer\OneDriveExplorer\'

winfor-python3-onedriveexplorer-gui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\OneDriveExplorer-GUI.lnk'
    - target: '{{ inpath }}\onedriveexplorer\OneDriveExplorer\OneDriveExplorer_GUI.py'
    - force: True
    - working_dir: '{{ inpath }}\onedriveexplorer\OneDriveExplorer\'
    - icon_location: '{{ inpath }}\onedriveexplorer\OneDriveExplorer\Images\ode.ico'
    - makedirs: True
    - require:
      - git: winfor-python3-onedriveexplorer-source
      - pip: winfor-python3-onedriveexplorer-requirements
      - file: winfor-python3-onedriveexplorer-header
      - win_path: winfor-python3-onedriveexplorer-env-vars
