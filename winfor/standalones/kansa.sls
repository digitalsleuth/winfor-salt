# Name: Kansa
# Website: https://github.com/davehull/kansa
# Description: Powershell Incident Response Framework
# Category: Windows Analysis
# Author: Dave Hull
# License: Apache License v2.0 (https://github.com/davehull/Kansa/blob/master/LICENSE)
# Version: 18NOV2022 (No defined version)
# Notes: 

include:
  - winfor.packages.git

kansa-download:
  git.latest:
    - name: https://github.com/davehull/kansa.git
    - target: 'C:\standalone\kansa'
    - rev: master
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git

kansa-env-vars:
  win_path.exists:
    - name: 'C:\standalone\kansa\'
