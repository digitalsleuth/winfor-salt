# Name: WinDepends
# Website: https://github.com/hfiref0x/WinDepends
# Description: Rewrite of Dependency Walker
# Category: Executables
# Author: hfiref0x
# License: MIT License (https://github.com/hfiref0x/WinDepends/blob/master/LICENSE)
# Version: 1.0.0.2412
# Notes: In Beta

{% set version = '1.0.0.2412' %}
{% set snapshot = '2412' %}
{% set hash = '0cbbc30791aeb4fd0395273534691b2a3ff2de40f3cd0a4de04a11febdac1aee' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

windepends-download-only:
  file.managed:
    - name: '{{ downloads }}\windepends\WinDepends_v{{ version }}_beta_snapshot.zip'
    - source: https://github.com/hfiref0x/WinDepends/releases/download/{{ snapshot }}-beta/WinDepends_v{{ version }}_beta_snapshot.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
