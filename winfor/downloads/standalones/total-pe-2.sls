# Name: Total PE 2
# Website: https://github.com/zodiacon/TotalPE2
# Description: PE Viewer
# Category: Executables
# Author: Pavel Yosifovich
# License: MIT License (https://github.com/zodiacon/TotalPE2/blob/master/LICENSE.txt)
# Version: 0.7.0.0
# Notes:

{% set version = '0.7.0.0' %}
{% set hash = 'c415eb0b99a47f9ddddc4c6ed58abe2802d4bdb8505d452d008f165fdf897750' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

total-pe-2-download-only:
  file.managed:
    - name: '{{ downloads }}\total-pe-2\total-pe-2-{{ version }}.exe'
    - source: https://github.com/zodiacon/AllTools/raw/master/TotalPE.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

