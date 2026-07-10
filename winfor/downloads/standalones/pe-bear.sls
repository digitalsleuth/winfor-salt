# Name: PE-bear
# Website: https://github.com/hasherezade/pe-bear
# Description: Portable Executable reversing tool with a GUI
# Category: Executables
# Author: hasherezade
# License: GNU General Public License v2 (https://github.com/hasherezade/pe-bear/blob/main/LICENSE)
# Version: 0.7.2
# Notes: 

{% set version = '0.7.2' %}
{% set hash = 'd2b995b213d0e6b3910a863c12fdb842722ce47387e65fc8e711ee9013d0876e' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

pe-bear-download-only:
  file.managed:
    - name: '{{ downloads }}\pe-bear\pe-bear-{{ version }}.zip'
    - source: https://github.com/hasherezade/pe-bear/releases/download/v{{ version }}/PE-bear_{{ version }}_qt6_x64_win_vs22.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
