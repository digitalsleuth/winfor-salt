# Name: WindowGrid
# Website: http://windowgrid.net
# Description: Tool to easily align windows and icons to a grid on the Windows Desktop
# Category: Utilities
# Author: Joshua Wilding
# License: Unknown
# Version: 1.3.1.1
# Notes: 

{% set version = '1.3.1.1' %}
{% set hash = 'EF7558B2869A1F74B81E19F1F84C715D95ABCA819920E6882D467323506EA25F' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

windowgrid-download:
  file.managed:
    - name: 'C:\salt\tempdownload\WindowGrid_{{ version }}.zip'
    - source: http://windowgrid.net/public/downloads/WindowGrid_{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

windowgrid-extract:
  archive.extracted:
    - name: 'C:\standalone\windowgrid\'
    - source: 'C:\salt\tempdownload\WindowGrid_{{ version }}.zip'
    - enforce_toplevel: False

windowgrid-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\WindowGrid.lnk'
    - target: 'C:\standalone\windowgrid\WindowGrid.exe'
    - force: True
    - working_dir: 'C:\standalone\windowgrid\'
    - makedirs: True
