# Name: time-decode
# Website: https://github.com/digitalsleuth/time_decode
# Description: Python timestamp encode / decode utility
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/time_decode/blob/master/LICENSE)
# Version: 9.0.0
# Notes: 

include:
  - winfor.packages.python3

time-decode:
  pip.installed:
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - upgrade: True
    - require:
      - sls: winfor.packages.python3
