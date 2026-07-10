# Name: PyInstaller Extractor
# Website: https://github.com/extremecoders-re/pyinstxtractor
# Description: Python script to extract contents of PyInstallers
# Category: Installers
# Author: ExtremeCoders-RE
# License: GNU General Public License v3.0 (https://github.com/extremecoders-re/pyinstxtractor/blob/master/LICENSE)
# Version: 2026.07
# Notes: Release version does not update with script

{% set version = '2026.07' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '94e0b6c9d5151bbeefc7e7452e96e24b396c2dbfcb0348e5f12c4c0865fefe58' %}

include:
  - winfor.downloads.packages.python3

pyinstxtractor-download-only:
  file.managed:
    - name: '{{ downloads }}\pyinstxtractor\pyinstxtractor-{{ version }}.py'
    - source: https://github.com/extremecoders-re/pyinstxtractor/raw/master/pyinstxtractor.py
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - sls: winfor.downloads.packages.python3

pyinstxtractor-header-download-only:
  file.prepend:
    - name: '{{ downloads }}\pyinstxtractor\pyinstxtractor-{{ version }}.py'
    - text: '#!/usr/bin/python3'
    - require:
      - file: pyinstxtractor-download-only
