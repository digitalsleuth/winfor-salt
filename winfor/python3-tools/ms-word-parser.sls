# Name: MS Word Parser
# Website: https://github.com/jjrboucher/MS-Word-Parser
# Description: MS Word document analysis tool
# Category: Documents / Editors
# Author: Jacques Boucher (jjrboucher) / Corey Forman (digitalsleuth)
# License: MIT License (https://github.com/jjrboucher/MS-Word-Parser/blob/master/LICENSE)
# Version: 3.0.1
# Notes:

{% set version = "3.0.1" %}

include:
  - winfor.packages.python3

ms-word-parser:
  pip.installed:
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - upgrade: True
    - require:
      - sls: winfor.packages.python3
