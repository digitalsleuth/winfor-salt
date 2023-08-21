# Name: PyInstaller Extractor
# Website: https://github.com/extremecoders-re/pyinstxtractor
# Description: Python script to extract contents of PyInstallers
# Category: Installers
# Author: ExtremeCoders-RE
# License: GNU General Public License v3.0 (https://github.com/extremecoders-re/pyinstxtractor/blob/master/LICENSE)
# Version: 2023.08
# Notes: Release version does not update with script

{% set hash = 'abfd7ed57f7b7ce8b387a8bfa1f72608fe6ac98956108537b753c669040b2c79' %}

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
