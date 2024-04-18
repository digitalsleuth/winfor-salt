# Name: Total PE 2
# Website: https://github.com/zodiacon/TotalPE2
# Description: PE Viewer
# Category: Executables
# Author: Pavel Yosifovich
# License: MIT License (https://github.com/zodiacon/TotalPE2/blob/master/LICENSE.txt)
# Version: 0.6.5.1
# Notes:

{% set version = '0.6.5.1' %}
{% set hash = 'ee9bb11f81c16998534134afb37cf1a3a168f1ca36aa273be1bb6e6feffc7229' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

total-pe-2-download-only:
  file.managed:
    - name: '{{ downloads }}\total-pe-2\TotalPE.exe'
    - source: https://github.com/zodiacon/AllTools/raw/master/TotalPE.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

