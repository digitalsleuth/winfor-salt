# Name: HexWalk
# Website: https://www.hexwalk.com
# Description: Hex Viewer and Editor
# Category: Raw Parsers / Decoders
# Author: Carmix
# License: GNU General Public License v3 (https://github.com/gcarmix/HexWalk/blob/main/LICENSE)
# Version: 2.1.0
# Notes: 

{% set version = '2.1.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt["environ.get"]("PROGRAMDATA") %}
{% set pkg = 'hexwalk-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\hexwalk\\' + pkg) %}

{% if exists %}

hexwalk-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\hexwalk\{{ pkg }}'
    - enforce_toplevel: False

hexwalk-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\HexWalk.lnk'
    - target: '{{ inpath }}\hexwalk\hexwalk.exe'
    - force: True
    - working_dir: '{{ inpath }}\hexwalk\'
    - makedirs: True
    - require:
      - archive: hexwalk-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
