# Name: WinDepends
# Website: https://github.com/hfiref0x/WinDepends
# Description: Rewrite of Dependency Walker
# Category: Executables
# Author: hfiref0x
# License: MIT License (https://github.com/hfiref0x/WinDepends/blob/master/LICENSE)
# Version: 1.0.0.2512
# Notes: In Beta

{% set version = '1.0.0.2512' %}
{% set snapshot = '2512' %}
{% set hash = 'cc07dcf8385ded623b4f3ac3ac3a52f01e36adb668db8c51ea2f55f24bfe2083' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

include:
  - winfor.downloads.packages.dotnet10-desktop-runtime

windepends-download-only:
  file.managed:
    - name: '{{ downloads }}\windepends\WinDepends_v{{ version }}_beta_snapshot.zip'
    - source: https://github.com/hfiref0x/WinDepends/releases/download/{{ snapshot }}-beta/WinDepends_v{{ version }}_beta_snapshot.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - sls: winfor.downloads.packages.dotnet10-desktop-runtime
