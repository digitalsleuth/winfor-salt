# Name: HexWalk
# Website: https://www.hexwalk.com
# Description: Hex Viewer and Editor
# Category: Raw Parsers / Decoders
# Author: Carmix
# License: GNU General Public License v3 (https://github.com/gcarmix/HexWalk/blob/main/LICENSE)
# Version: 1.10.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = "1.10.0" %}
{% set hash = "60987a9f2003ed8955c90ae2157a60dc3bb39758431edff1cc4265dbd069850a" %}

hexwalk-download-only:
  file.managed:
    - name: '{{ downloads }}\hexwalk\hexwalk_{{ version }}_Windows_X64.zip'
    - source: https://github.com/gcarmix/HexWalk/releases/download/v{{ version }}/hexwalk_{{ version }}_Windows_X64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
