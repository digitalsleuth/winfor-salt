# Name: FastCopy
# Website: https://fastcopy.jp
# Description: Fast file copy software which can retain file details
# Category: Utilities
# Author: FastCopy Lab - https://fastcopy.jp/company.html
# License: Copyright - All rights reserved - https://fastcopy.jp/help/fastcopy_eng.htm#license
# Version: 4.2.1
# Notes:

{% set version = '4.2.1' %}
{% set hash = 'd2ab5d9b42d151ce4f6a28566bb6ca0851fb93027fe7fdad4b6ca6176a64a490' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

fastcopy-download-only:
  file.managed:
    - name: '{{ downloads }}\FastCopy{{ version }}_installer.exe'
    - source: https://github.com/FastCopyLab/FastCopyDist/raw/main/FastCopy{{ version }}_installer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
