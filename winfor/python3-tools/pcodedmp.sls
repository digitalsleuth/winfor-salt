# Name: pcodedmp
# Website: https://github.com/bontchev/pcodedmp
# Description: Python VBA p-code disassembler
# Category: Documents / Editors
# Author: Vesselin Bontchev
# License: GNU General Public License v3 (https://github.com/bontchev/pcodedmp/blob/master/LICENSE)
# Version: 1.2.6
# Notes: 

include:
  - winfor.packages.python3

pcodedmp:
  pip.installed:
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.packages.python3
