# Name: UFADE (Universal Forensic Apple Device Extractor)
# Website: https://github.com/prosch88/UFADE
# Description: Standalone tool to extract data from Apple Devices
# Category: Mobile Analysis
# Author: Christian Peter (prosch88)
# License: GNU General Public License 3 (https://github.com/prosch88/UFADE/blob/main/LICENSE)
# Version: 1.0.3
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set version = '1.0.3' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

ufade-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\ufade\UFADE_{{ version }}_win_x64.zip'
    - enforce_toplevel: True
    - overwrite: True

ufade-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\UFADE.lnk'
    - target: '{{ inpath }}\UFADE\UFADE.exe'
    - force: True
    - working_dir: '{{ inpath }}\UFADE\'
    - makedirs: True
    - require:
      - archive: ufade-extract-offline
