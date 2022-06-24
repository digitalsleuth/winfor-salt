# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 
{% set hash = 'b9184bf8d02db5547227185110c50b8243232fe3369a04e5847a2356ce3dc89c' %}

include:
  - winfor.packages.python3

pyinstxtractor-download:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\pyinstxtractor.py'
    - source: https://github.com/extremecoders-re/pyinstxtractor/raw/master/pyinstxtractor.py
    - source_hash: sha256={{ hash }}
    - makedirs: False
    - require:
      - sls: winfor.packages.python3

pyinstxtractor-header:
  file.prepend:
    - name: 'C:\Program Files\Python310\Scripts\pyinstxtractor.py'
    - text: '#!/usr/bin/python3'
    - require:
      - file: pyinstxtractor-download
