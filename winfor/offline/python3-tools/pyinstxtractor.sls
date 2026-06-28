# Name: PyInstaller Extractor
# Website: https://github.com/extremecoders-re/pyinstxtractor
# Description: Python script to extract contents of PyInstallers
# Category: Installers
# Author: ExtremeCoders-RE
# License: GNU General Public License v3.0 (https://github.com/extremecoders-re/pyinstxtractor/blob/master/LICENSE)
# Version: 2026.04
# Notes: Release version does not update with script

{% set version = '2026.04' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set hash = 'f54fd54769b99a84e2b3fc9d767c6a104a9fb83ab6566bb0edb30f44e234b239' %}

include:
  - winfor.offline.packages.python3

pyinstxtractor-offline:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\pyinstxtractor.py'
    - source: '{{ downloads }}\pyinstxtractor\pyinstxtractor-{{ version }}.py'
    - skip_verify: True
    - makedirs: False
    - require:
      - sls: winfor.offline.packages.python3

