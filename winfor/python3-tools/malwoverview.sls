# Name: malwoverview
# Website: https://github.com/alexandreborges/malwoverview
# Description: Malware metadata lookup tool
# Category: Executables
# Author: Alexandre Borges
# License: GNU General Public License v3.0 (https://github.com/alexandreborges/malwoverview/blob/master/LICENSE)
# Version: 8.0.5
# Notes: 

{% set version = '8.0.5' %}

  - winfor.packages.python3

malwoverview:
  pip.installed:
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.packages.python3
