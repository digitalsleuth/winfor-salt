# Name: PyInstaller Extractor NG
# Website: https://github.com/pyinstxtractor/pyinstxtractor-ng
# Description: A standalone executable to extract the contents of PyInstaller packages
# Category: Installers
# Author: ExtremeCoders-RE
# License: GNU General Public License v3.0 (https://github.com/pyinstxtractor/pyinstxtractor-ng/blob/main/LICENSE)
# Version: 2025.01.05
# Notes: 

{% set version = '2025.01.05' %}
{% set hash = '33f8225db6d057e903b9eba3eddf2e92e564cd1b59382106b4569583b3fedfb0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pyinstxtractor-ng-download-only:
  file.managed:
    - name: '{{ downloads }}\pyinstxtractor-ng\pyinstxtractor-ng-{{ version }}.exe'
    - source: https://github.com/pyinstxtractor/pyinstxtractor-ng/releases/download/{{ version }}/pyinstxtractor-ng.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

