# Name: USN Journal Parser
# Website: https://github.com/digitalsleuth/USN-Journal-Parser
# Description: Updated version of PoorBillionaire's USN-Journal-Parser
# Category: Windows Analysis
# Author: Corey Forman / Adam Witt
# License: MIT License (https://github.com/digitalsleuth/USN-Journal-Parser/blob/main/LICENSE)
# Version: 5.0.0
# Notes: Commands: usn, usn.py

{% set version = '5.0.0' %}

include:
  - winfor.packages.python3

python3-usn-journal-parser:
  pip.installed:
    - name: git+https://github.com/digitalsleuth/USN-Journal-Parser
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.packages.python3

python3-usn-wrapper:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\usn.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - 'python3 "C:\Program Files\Python310\Scripts\usn.py" %*'
