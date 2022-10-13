# Name: regripper
# Website: https://github.com/keydet89/RegRipper3.0
# Description: Registry parsing toolsuite
# Category: 
# Author: Harlan Carvey
# License: MIT License (https://github.com/keydet89/RegRipper3.0/blob/master/license.md)
# Notes: rr.exe

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.git
  - winfor.packages.strawberryperl

winfor-standalones-regripper:
  git.latest:
    - name: https://github.com/keydet89/RegRipper3.0.git
    - target: 'C:\standalone\regripper'
    - rev: master
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git

winfor-standalones-regripper-requirements:
  cmd.run:
    - name: 'C:\Strawberry\perl\bin\cpanm install Parse::Win32Registry'
    - require:
      - sls: winfor.packages.strawberryperl

regripper-env-vars:
  win_path.exists:
    - name: 'C:\standalone\regripper\'

winfor-standalones-regripper-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\RegRipper.lnk'
    - target: 'C:\standalone\regripper\rr.exe'
    - force: True
    - working_dir: 'C:\standalone\regripper\'
    - makedirs: True
    - require:
      - git: winfor-standalones-regripper
