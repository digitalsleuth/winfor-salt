# Name: maldump
# Website: https://github.com/NUKIB/maldump
# Description: Python 3 tool for extracting quarantined files from a live system or mounted image
# Category: Executables
# Author: Czech Republic National Cyber and Information Security Agency
# License: https://github.com/NUKIB/maldump/blob/main/LICENSE
# Version: 0.5.0
# Notes: 

{% set version = '0.5.0' %}

include:
  - winfor.packages.python3

maldump-install:
  pip.installed:
    - name: maldump
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.packages.python3

