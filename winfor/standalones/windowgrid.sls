# Name: WindowGrid
# Website: http://windowgrid.net
# Description: Tool to easily align windows and icons to a grid on the Windows Desktop
# Category: Utilities
# Author: Joshua Wilding
# License: Unknown
# Version: 1.3.1.1
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '1.3.1.1' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('windowgrid') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

windowgrid-download:
  file.managed:
    - name: 'C:\salt\tempdownload\WindowGrid_{{ version }}.zip'
    - source: http://windowgrid.net/public/downloads/WindowGrid_{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

windowgrid-extract:
  archive.extracted:
    - name: '{{ inpath }}\windowgrid\'
    - source: 'C:\salt\tempdownload\WindowGrid_{{ version }}.zip'
    - enforce_toplevel: False

windowgrid-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\WindowGrid.lnk'
    - target: '{{ inpath }}\windowgrid\WindowGrid.exe'
    - force: True
    - working_dir: '{{ inpath }}\windowgrid\'
    - makedirs: True
