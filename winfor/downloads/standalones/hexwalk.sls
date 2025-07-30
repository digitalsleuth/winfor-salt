# Name: HexWalk
# Website: https://www.hexwalk.com
# Description: Hex Viewer and Editor
# Category: Raw Parsers / Decoders
# Author: Carmix
# License: GNU General Public License v3 (https://github.com/gcarmix/HexWalk/blob/main/LICENSE)
# Version: 1.9.1
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = "1.9.1" %}
{% set hash = "93f4845b0f31229dac347b79926270be57c29aa3c8e763309a0dbba8fba525a9" %}

hexwalk-download-only:
  file.managed:
    - name: '{{ downloads }}\hexwalk\hexwalk_{{ version }}_Windows_X64.zip'
    - source: https://github.com/gcarmix/HexWalk/releases/download/v{{ version }}/hexwalk_{{ version }}_Windows_X64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
