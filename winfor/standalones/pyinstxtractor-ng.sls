# Name: PyInstaller Extractor NG
# Website: https://github.com/pyinstxtractor/pyinstxtractor-ng
# Description: A standalone executable to extract the contents of PyInstaller packages
# Category: Installers
# Author: ExtremeCoders-RE
# License: GNU General Public License v3.0 (https://github.com/pyinstxtractor/pyinstxtractor-ng/blob/main/LICENSE)
# Version: 2026.07.03
# Notes: 

{% set version = '2026.07.03' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('pyinstxtractor-ng') %}

include:
  - winfor.config.shims

pyinstxtractor-ng-download:
  file.managed:
    - name: '{{ inpath }}\pyinstxtractor-ng\pyinstxtractor-ng.exe'
    - source: https://github.com/pyinstxtractor/pyinstxtractor-ng/releases/download/{{ version }}/pyinstxtractor-ng.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

pyinstxtractor-ng-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\pyinstxtractor-ng\pyinstxtractor-ng.exe -OutPath {{ inpath }}\shims\pyinstxtractor-ng.exe'
    - require:
      - sls: winfor.config.shims
