# Name: peepdf-3
# Website: https://github.com/digitalsleuth/peepdf-3
# Description: PDF analysis and malicious code analyzer.
# Category: Documents / Editors
# Author: Jose Miguel Esparza and Corey Forman
# License: GNU General Public License (GPL) v3: https://github.com/digitalsleuth/peepdf-3/blob/main/COPYING
# Version: 5.1.1
# Notes:

{% set version = '5.1.1' %}

include:
  - winfor.packages.python3
  - winfor.python3-tools.stpyv8

peepdf-3-install:
  pip.installed:
    - name: peepdf-3
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - upgrade: True
    - require:
      - sls: winfor.packages.python3
      - sls: winfor.python3-tools.stpyv8
