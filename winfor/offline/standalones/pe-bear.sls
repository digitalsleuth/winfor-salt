# Name: PE-bear
# Website: https://github.com/hasherezade/pe-bear
# Description: Portable Executable reversing tool with a GUI
# Category: Executables
# Author: hasherezade
# License: GNU General Public License v2 (https://github.com/hasherezade/pe-bear/blob/main/LICENSE)
# Version: 0.7.1
# Notes: 

{% set version = '0.7.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.offline.packages.ms-vcpp-2017-redist-x64

pe-bear-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\pe-bear'
    - source: '{{ downloads }}\pe-bear\PE-bear_{{ version }}_qt6.8_x64_win_vs22.zip'
    - enforce_toplevel: False

pe-bear-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\PE-Bear.lnk'
    - target: '{{ inpath }}\pe-bear\PE-bear.exe'
    - force: True
    - working_dir: '{{ inpath }}\pe-bear\'
    - makedirs: True
    - require:
      - archive: pe-bear-extract-offline
