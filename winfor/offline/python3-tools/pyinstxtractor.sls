# Name: PyInstaller Extractor
# Website: https://github.com/extremecoders-re/pyinstxtractor
# Description: Python script to extract contents of PyInstallers
# Category: Installers
# Author: ExtremeCoders-RE
# License: GNU General Public License v3.0 (https://github.com/extremecoders-re/pyinstxtractor/blob/master/LICENSE)
# Version: 2026.07
# Notes: Release version does not update with script

{% set version = '2026.07' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'pyinstxtractor-'~ version ~'.py' %}
{% set exists = salt['file.file_exists'](downloads + '\\pyinstxtractor\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3

pyinstxtractor-offline:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\pyinstxtractor.py'
    - source: '{{ downloads }}\pyinstxtractor\{{ pkg }}'
    - skip_verify: True
    - makedirs: True
    - require:
      - sls: winfor.offline.packages.python3

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
