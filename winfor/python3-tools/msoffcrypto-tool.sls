# Name: msoffcrypto-tool
# Website: https://github.com/nolze/msoffcrypto-tool
# Description: Python library for decrypting encrypted MS Office Files
# Category: Documents / Editors
# Author: Nolze
# License: MIT License (https://github.com/nolze/msoffcrypto-tool/blob/master/LICENSE.txt)
# Version: 5.4.2
# Notes: 

{% set version = '5.4.2' %}

include:
  - winfor.packages.python3

msoffcrypto-tool:
  pip.installed:
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.packages.python3
