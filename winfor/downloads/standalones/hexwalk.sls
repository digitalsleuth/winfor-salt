# Name: HexWalk
# Website: https://www.hexwalk.com
# Description: Hex Viewer and Editor
# Category: Raw Parsers / Decoders
# Author: Carmix
# License: GNU General Public License v3 (https://github.com/gcarmix/HexWalk/blob/main/LICENSE)
# Version: 2.1.0
# Notes: 

{% set version = '2.1.0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '1ac88a0fd6c6b099aacd656128bdc7028b9b17780bc8d130b4d9723cef86b72d' %}

hexwalk-download-only:
  file.managed:
    - name: '{{ downloads }}\hexwalk\hexwalk-{{ version }}.zip'
    - source: https://github.com/gcarmix/HexWalk/releases/download/v{{ version }}/hexwalk_{{ version }}_Windows_X64_portable.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
