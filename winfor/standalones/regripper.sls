# Name: regripper
# Website: https://github.com/keydet89/RegRipper3.0
# Description: Registry parsing toolsuite
# Category: 
# Author: Harlan Carvey
# License: MIT License (https://github.com/keydet89/RegRipper3.0/blob/master/license.md)
# Notes: rr.exe
{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set home = salt['user.info'](user).home %}

include:
  - winfor.packages.git
  - winfor.config.user

winfor-standalones-regripper:
  git.latest:
    - name: https://github.com/keydet89/RegRipper3.0.git
    - target: 'C:\standalone\regripper'
    - rev: master
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git

regripper-env-vars:
  win_path.exists:
    - name: 'C:\standalone\regripper\'

winfor-standalones-regripper-shortcut:
  file.shortcut:
    - name: '{{ home }}\Desktop\RegRipper.lnk'
    - target: 'C:\standalone\regripper\rr.exe'
    - user: forensics
    - force: True
    - working_dir: 'C:\standalone\regripper\'
    - makedirs: True
    - require:
      - git: winfor-standalones-regripper
      - user: winfor-user-{{ user }}
