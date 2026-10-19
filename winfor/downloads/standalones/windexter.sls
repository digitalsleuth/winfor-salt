# Name: Windexter
# Website: https://github.com/digitalsleuth/windexter
# Description: A Windows Search Index parser, written in C#
# Category: Windows Analysis
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/windexter/blob/main/LICENSE)
# Version: 1.0.3
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.0.3' %}
{% set hash = '1ed0f47fdf8f622b79d4e970004ad7529ef77e20b295ac5c20a01ae2a19eb387' %}

windexter-download-only:
  file.managed:
    - name: '{{ downloads }}\windexter\windexter-{{ version }}.exe'
    - source: https://github.com/digitalsleuth/windexter/releases/download/v{{ version }}/Windexter-v{{ version }}.0.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
