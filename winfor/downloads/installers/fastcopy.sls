# Name: FastCopy
# Website: https://fastcopy.jp
# Description: Fast file copy software which can retain file details
# Category: Utilities
# Author: FastCopy Lab - https://fastcopy.jp/company.html
# License: Copyright - All rights reserved - https://fastcopy.jp/help/fastcopy_eng.htm#license
# Version: 5.9.0
# Notes:

{% set version = '5.9.0' %}
{% set hash = 'e0daf618bd4113fe9e4c56eb8faf7111d61b9661756b758d3770ef8c8a09a8e2' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

fastcopy-download-only:
  file.managed:
    - name: '{{ downloads }}\fastcopy\FastCopy{{ version }}_installer.exe'
    - source: https://github.com/FastCopyLab/FastCopyDist2/raw/main/FastCopy{{ version }}_installer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
