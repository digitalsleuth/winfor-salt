# Name: WinDepends
# Website: https://github.com/hfiref0x/WinDepends
# Description: Rewrite of Dependency Walker
# Category: Executables
# Author: hfiref0x
# License: MIT License (https://github.com/hfiref0x/WinDepends/blob/master/LICENSE)
# Version: 1.0.0.2504
# Notes: In Beta

{% set version = '1.0.0.2504' %}
{% set snapshot = '2504' %}
{% set hash = '55edc345c9bedfa03b99b21f17c3b357c5c9b526ade9ee61e540f0f4925057fa' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

windepends-download-only:
  file.managed:
    - name: '{{ downloads }}\windepends\WinDepends_v{{ version }}_beta_snapshot.zip'
    - source: https://github.com/hfiref0x/WinDepends/releases/download/{{ snapshot }}-beta/WinDepends_v{{ version }}_beta_snapshot.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
