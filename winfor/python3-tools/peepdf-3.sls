# Name: peepdf-3
# Website: https://github.com/digitalsleuth/peepdf-3
# Description: PDF analysis and malicious code analyzer.
# Category: Documents / Editors
# Author: Jose Miguel Esparza and Corey Forman
# License: GNU General Public License (GPL) v3: https://github.com/digitalsleuth/peepdf-3/blob/main/COPYING
# Version: 3.0.3
# Notes:

{% set version = '3.0.3' %}

include:
  - winfor.packages.python3
  - winfor.python3-tools.stpyv8

peepdf-3:
  pip.installed:
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - upgrade: True
    - require:
      - sls: winfor.packages.python3
      - sls: winfor.python3-tools.stpyv8
