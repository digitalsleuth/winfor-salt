# Name: pyson4
# Website: https://github.com/digitalsleuth/pyson4
# Description: A python3 jsonlz4 file parser for Firefox
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: GNU General Public License v3 (https://github.com/digitalsleuth/pyson4/blob/master/LICENSE)
# Version: 1.1
# Notes: pyson4, pyson4.py

include:
  - winfor.packages.python3

python3-pyson4:
  pip.installed:
    - name: git+https://github.com/digitalsleuth/pyson4
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.packages.python3

python3-pyson4-wrapper:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\pyson4.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - 'python3 "C:\Program Files\Python310\Scripts\pyson4.py" %*'
    - require:
      - pip: python3-pyson4
