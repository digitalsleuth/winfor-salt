# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

include:
  - winfor.packages.git

bitsparser-clone:
  git.latest:
    - name: https://github.com/digitalsleuth/bitsparser
    - target: 'C:\standalone\bitsparser'
    - rev: master
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git

bitsparser-requirements:
  pip.installed:
    - requirements: 'C:\standalone\bitsparser\requirements.txt'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - git: bitsparser-clone

bitsparser-setup:
  win_path.exists:
    - name: 'C:\standalone\bitsparser\'
    - require:
      - pip: bitsparser-requirements
