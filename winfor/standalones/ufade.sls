# Name: UFADE (Universal Forensic Apple Device Extractor)
# Website: https://github.com/prosch88/UFADE
# Description: Standalone tool to extract data from Apple Devices
# Category: Mobile Analysis
# Author: prosch88
# License: GNU General Public License 3 (https://github.com/prosch88/UFADE/blob/main/LICENSE)
# Version: 0.9.4
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '0.9.4' %}
{% set hash = '054f612e9c6d7c9010a080abb6070e60955fa98221a1b89c35aed8982177be8b' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

ufade-download:
  file.managed:
    - name: 'C:\salt\tempdownload\UFADE_{{ version }}_win_x64.zip'
    - source: https://github.com/prosch88/UFADE/releases/download/v{{ version }}/UFADE_{{ version }}_win_x64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

ufade-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - enforce_toplevel: True
    - source: 'C:\salt\tempdownload\UFADE_{{ version }}_win_x64.zip'
    - overwrite: True
    - require:
      - file: ufade-download

ufade-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\UFADE.lnk'
    - target: '{{ inpath }}\UFADE\UFADE.exe'
    - force: True
    - working_dir: '{{ inpath }}\UFADE\'
    - makedirs: True
    - require:
      - file: ufade-download
      - archive: ufade-extract
