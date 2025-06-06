# Name: PE-bear
# Website: https://github.com/hasherezade/pe-bear
# Description: Portable Executable reversing tool with a GUI
# Category: Executables
# Author: hasherezade
# License: GNU General Public License v2 (https://github.com/hasherezade/pe-bear/blob/main/LICENSE)
# Version: 0.7.1
# Notes: 

{% set version = '0.7.1' %}
{% set hash = '28732ad3ab70ef889d02699658a81d696f208b26bb0f3d72c8c1eb60220d42a0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pe-bear-download-only:
  file.managed:
    - name: '{{ downloads }}\pe-bear\PE-bear_{{ version }}_qt6.8_x64_win_vs22.zip'
    - source: https://github.com/hasherezade/pe-bear/releases/download/v{{ version }}/PE-bear_{{ version }}_qt6.8_x64_win_vs22.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
