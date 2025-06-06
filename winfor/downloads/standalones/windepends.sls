# Name: WinDepends
# Website: https://github.com/hfiref0x/WinDepends
# Description: Rewrite of Dependency Walker
# Category: Executables
# Author: hfiref0x
# License: MIT License (https://github.com/hfiref0x/WinDepends/blob/master/LICENSE)
# Version: 1.0.0.2505
# Notes: In Beta

{% set version = '1.0.0.2505' %}
{% set snapshot = '2505' %}
{% set hash = '3ee5a624c510e52bc6b2c99b0d3a1cf6b3def2946179615f7534f495811c0f84' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

windepends-download-only:
  file.managed:
    - name: '{{ downloads }}\windepends\WinDepends_v{{ version }}_beta_snapshot.zip'
    - source: https://github.com/hfiref0x/WinDepends/releases/download/{{ snapshot }}-beta/WinDepends_v{{ version }}_beta_snapshot.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
