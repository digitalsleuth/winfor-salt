# Name: FastCopy
# Website: https://fastcopy.jp
# Description: Fast file copy software which can retain file details
# Category: Utilities
# Author: FastCopy Lab - https://fastcopy.jp/company.html
# License: Copyright - All rights reserved - https://fastcopy.jp/help/fastcopy_eng.htm#license
# Version: 5.11.2
# Notes:

{% set version = '5.11.2' %}
{% set hash = '70b273dd08c15d40fac59a217b93be195bacfa47acabd031463a6df800d29fea' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

fastcopy-download-only:
  file.managed:
    - name: '{{ downloads }}\fastcopy\FastCopy{{ version }}_installer.exe'
    - source: https://github.com/FastCopyLab/FastCopyDist2/raw/main/FastCopy{{ version }}_installer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
