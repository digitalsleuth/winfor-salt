# Name: WindowGrid
# Website: http://windowgrid.net
# Description: Tool to easily align windows and icons to a grid on the Windows Desktop
# Category: Utilities
# Author: Joshua Wilding
# License: Unknown
# Version: 1.3.1.1
# Notes: 

{% set version = '1.3.1.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'windowgrid-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\windowgrid\\' + pkg) %}

{% if exists %}

windowgrid-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\windowgrid\'
    - source: '{{ downloads }}\windowgrid\{{ pkg }}'
    - enforce_toplevel: False

windowgrid-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\WindowGrid.lnk'
    - target: '{{ inpath }}\windowgrid\WindowGrid.exe'
    - force: True
    - working_dir: '{{ inpath }}\windowgrid\'
    - makedirs: True
    - require:
      - archive: windowgrid-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}