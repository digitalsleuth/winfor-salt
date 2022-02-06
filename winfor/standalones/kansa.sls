# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
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
