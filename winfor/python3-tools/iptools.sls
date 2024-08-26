# Name: iptools
# Website: https://github.com/digitalsleuth/forensics_tools
# Description: IP / Hex / Dec Conversion tool 
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: GNU General Public License v3.0 (https://github.com/digitalsleuth/forensics_tools/blob/master/LICENSE)
# Version: 1.1
# Notes: 

include:
  - winfor.packages.python3

iptools-download:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\iptools.py'
    - source: https://github.com/digitalsleuth/forensics_tools/raw/master/iptools.py
    - source_hash: sha256=de771ec7c7748fa8a47581e5dc40b3490de62e82482a85dff39f8246ce220b89
    - makedirs: True
    - require:
      - sls: winfor.packages.python3

iptools-wrapper:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\iptools.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - 'python3 "C:\Program Files\Python310\Scripts\iptools.py" %*'
    - require:
      - file: iptools-download
