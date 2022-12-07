# Name: Noriben
# Website: https://github.com/rurik/noriben
# Description: Malware Analysis Sandbox based on Python
# Category: Executables
# Author: Brian Baskin (Rurik)
# License: Apache License v2 (https://github.com/Rurik/Noriben/blob/master/LICENSE)
# Version: 1.8.7
# Notes: 

include:
  - winfor.packages.git

noriben-clone:
  git.latest:
    - name: https://github.com/rurik/noriben
    - target: 'C:\standalone\noriben'
    - rev: master
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git

noriben-header:
  file.prepend:
    - name: 'C:\standalone\noriben\Noriben.py'
    - text: '#!/usr/bin/python3'
    - require:
      - git: noriben-clone

noriben-env-vars:
  win_path.exists:
    - name: 'C:\standalone\noriben\'
