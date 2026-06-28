# Name: PyInstaller Extractor NG
# Website: https://github.com/pyinstxtractor/pyinstxtractor-ng
# Description: A standalone executable to extract the contents of PyInstaller packages
# Category: Installers
# Author: ExtremeCoders-RE
# License: GNU General Public License v3.0 (https://github.com/pyinstxtractor/pyinstxtractor-ng/blob/main/LICENSE)
# Version: 2026.04.07
# Notes: 

{% set version = '2026.04.07' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.config.shims

pyinstxtractor-ng-copy-offline:
  file.copy:
    - name: '{{ inpath }}\pyinstxtractor-ng\pyinstxtractor-ng.exe'
    - source: '{{ downloads }}\pyinstxtractor-ng\pyinstxtractor-ng-{{ version }}.exe'
    - skip_verify: True
    - makedirs: True
    - force: True

pyinstxtractor-ng-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\pyinstxtractor-ng\pyinstxtractor-ng.exe -OutPath {{ inpath }}\shims\pyinstxtractor-ng.exe'
    - require:
      - sls: winfor.config.shims
      - file: pyinstxtractor-ng-copy-offline
