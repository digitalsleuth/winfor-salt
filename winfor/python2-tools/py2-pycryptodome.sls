# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

include:
  - winfor.packages.vcforpython27

py2-pycryptodome:
  pip.installed:
    - name: 'pycryptodome'
    - bin_env: 'C:\Python27\python.exe'
    - require:
      - sls: winfor.packages.vcforpython27
