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
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('pyinstxtractor') %}

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
