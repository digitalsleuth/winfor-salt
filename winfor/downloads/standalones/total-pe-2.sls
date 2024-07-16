# Name: Total PE 2
# Website: https://github.com/zodiacon/TotalPE2
# Description: PE Viewer
# Category: Executables
# Author: Pavel Yosifovich
# License: MIT License (https://github.com/zodiacon/TotalPE2/blob/master/LICENSE.txt)
# Version: 0.6.5.1
# Notes:

{% set version = '0.6.5.1' %}
{% set hash = 'c0c2af261f8b4e47be845ce6740fa2d51b9baa4731795a22b7ed46a4b84ecdc0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

total-pe-2-download-only:
  file.managed:
    - name: '{{ downloads }}\total-pe-2\TotalPE.exe'
    - source: https://github.com/zodiacon/AllTools/raw/master/TotalPE.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

