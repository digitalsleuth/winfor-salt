# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 
# Version:

{% set hash = '6720e11aba64f7302240858bda894af8e7bfb1e577ece219558aab38ed4fa93a' %}

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
