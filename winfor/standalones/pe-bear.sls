# Name: PE-bear
# Website: https://github.com/hasherezade/pe-bear
# Description: Portable Executable reversing tool with a GUI
# Category: Executables
# Author: hasherezade
# License: GNU General Public License v2 (https://github.com/hasherezade/pe-bear/blob/main/LICENSE)
# Version: 0.7.2
# Notes: 

{% set version = '0.7.2' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = 'd2b995b213d0e6b3910a863c12fdb842722ce47387e65fc8e711ee9013d0876e' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.ms-vcpp-2017-redist-x64

pe-bear-download:
  file.managed:
    - name: 'C:\salt\tempdownload\pe-bear-{{ version }}.zip'
    - source: https://github.com/hasherezade/pe-bear/releases/download/v{{ version }}/PE-bear_{{ version }}_qt6_x64_win_vs22.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - sls: winfor.packages.ms-vcpp-2017-redist-x64

pe-bear-extract:
  archive.extracted:
    - name: '{{ inpath }}\pe-bear'
    - source: 'C:\salt\tempdownload\pe-bear-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: pe-bear-download

standalones-pe-bear-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\PE-Bear.lnk'
    - target: '{{ inpath }}\pe-bear\PE-bear.exe'
    - force: True
    - working_dir: '{{ inpath }}\pe-bear\'
    - makedirs: True
    - require:
      - file: pe-bear-download
      - archive: pe-bear-extract
