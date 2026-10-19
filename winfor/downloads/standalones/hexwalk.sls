# Name: HexWalk
# Website: https://www.hexwalk.com
# Description: Hex Viewer and Editor
# Category: Raw Parsers / Decoders
# Author: Carmix
# License: GNU General Public License v3 (https://github.com/gcarmix/HexWalk/blob/main/LICENSE)
# Version: 2.2.1
# Notes: 

{% set version = '2.2.1' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'd8c5aa6c8c918f3aab19f6e2b756c903df512542572b91eeef897b97e33a21f9' %}

hexwalk-download-only:
  file.managed:
    - name: '{{ downloads }}\hexwalk\hexwalk-{{ version }}.zip'
    - source: https://github.com/gcarmix/HexWalk/releases/download/v{{ version }}/hexwalk_{{ version }}_Windows_X64_portable.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
