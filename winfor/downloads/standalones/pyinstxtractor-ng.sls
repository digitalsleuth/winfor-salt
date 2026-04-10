# Name: PyInstaller Extractor NG
# Website: https://github.com/pyinstxtractor/pyinstxtractor-ng
# Description: A standalone executable to extract the contents of PyInstaller packages
# Category: Installers
# Author: ExtremeCoders-RE
# License: GNU General Public License v3.0 (https://github.com/pyinstxtractor/pyinstxtractor-ng/blob/main/LICENSE)
# Version: 2026.04.07
# Notes: 

{% set version = '2026.04.07' %}
{% set hash = 'd19488732ff8237f5a1ed47d2a3d36620077975854854102e65837c5aad69ca5' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pyinstxtractor-ng-download-only:
  file.managed:
    - name: '{{ downloads }}\pyinstxtractor-ng\pyinstxtractor-ng-{{ version }}.exe'
    - source: https://github.com/pyinstxtractor/pyinstxtractor-ng/releases/download/{{ version }}/pyinstxtractor-ng.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

