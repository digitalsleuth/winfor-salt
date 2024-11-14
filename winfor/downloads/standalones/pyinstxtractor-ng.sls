# Name: PyInstaller Extractor NG
# Website: https://github.com/pyinstxtractor/pyinstxtractor-ng
# Description: A standalone executable to extract the contents of PyInstaller packages
# Category: Installers
# Author: ExtremeCoders-RE
# License: GNU General Public License v3.0 (https://github.com/pyinstxtractor/pyinstxtractor-ng/blob/main/LICENSE)
# Version: 2024.08.25
# Notes: 

{% set version = '2024.08.25' %}
{% set hash = '6eaea2e2ef521f51b6f7ac7e1774eadc7c3234c76629738dc6868a53452687d4' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pyinstxtractor-ng-download-only:
  file.managed:
    - name: '{{ downloads }}\pyinstxtractor-ng\pyinstxtractor-ng-{{ version }}.exe'
    - source: https://github.com/pyinstxtractor/pyinstxtractor-ng/releases/download/{{ version }}/pyinstxtractor-ng.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
