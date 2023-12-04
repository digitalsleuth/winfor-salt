# Name: PyInstaller Extractor
# Website: https://github.com/extremecoders-re/pyinstxtractor
# Description: Python script to extract contents of PyInstallers
# Category: Installers
# Author: ExtremeCoders-RE
# License: GNU General Public License v3.0 (https://github.com/extremecoders-re/pyinstxtractor/blob/master/LICENSE)
# Version: 2023.12
# Notes: Release version does not update with script

{% set hash = '9d1b4323a340e6361f793d4797c356cfac1c2838c6bff8a5960443aede9a2ebb' %}

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
