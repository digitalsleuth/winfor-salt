# Name: WinDepends
# Website: https://github.com/hfiref0x/WinDepends
# Description: Rewrite of Dependency Walker
# Category: Executables
# Author: hfiref0x
# License: MIT License (https://github.com/hfiref0x/WinDepends/blob/master/LICENSE)
# Version: 1.0.0.2512
# Notes: In Beta

{% set version = '1.0.0.2512' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('windepends') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

include:
  - winfor.downloads.packages.dotnet10-desktop-runtime

windepends-download-only:
  file.managed:
    - name: '{{ downloads }}\windepends\windepends-{{ version }}.zip'
    - source: https://github.com/hfiref0x/WinDepends/releases/download/{{ version.split('.')[-1] }}-beta/WinDepends_v{{ version }}_beta_snapshot.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - sls: winfor.downloads.packages.dotnet10-desktop-runtime
