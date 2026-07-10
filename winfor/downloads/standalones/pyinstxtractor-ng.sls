# Name: PyInstaller Extractor NG
# Website: https://github.com/pyinstxtractor/pyinstxtractor-ng
# Description: A standalone executable to extract the contents of PyInstaller packages
# Category: Installers
# Author: ExtremeCoders-RE
# License: GNU General Public License v3.0 (https://github.com/pyinstxtractor/pyinstxtractor-ng/blob/main/LICENSE)
# Version: 2026.07.03
# Notes: 

{% set version = '2026.07.03' %}
{% set hash = '5edd80c8a2d90ade243a82716faa6952c401226bce1414aa0c0e59d592060a6c' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pyinstxtractor-ng-download-only:
  file.managed:
    - name: '{{ downloads }}\pyinstxtractor-ng\pyinstxtractor-ng-{{ version }}.exe'
    - source: https://github.com/pyinstxtractor/pyinstxtractor-ng/releases/download/{{ version }}/pyinstxtractor-ng.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

