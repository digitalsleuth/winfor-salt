# Name: FastCopy
# Website: https://fastcopy.jp
# Description: Fast file copy software which can retain file details
# Category: Utilities
# Author: FastCopy Lab - https://fastcopy.jp/company.html
# License: Copyright - All rights reserved - https://fastcopy.jp/help/fastcopy_eng.htm#license
# Version: 4.1.7
# Notes:

{% set version = '4.1.7' %}
{% set hash = '683E1EB788EF37AF31E521F432B457DF737EDD09D507298C581F24DD6D9ED34D' %}

fastcopy-download:
  file.managed:
    - name: 'C:\salt\tempdownload\FastCopy{{ version }}_installer.exe'
    - source: https://github.com/FastCopyLab/FastCopyDist/raw/main/FastCopy{{ version }}_installer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

fastcopy-install:
  cmd.run:
    - name: 'C:\salt\tempdownload\FastCopy{{ version }}_installer.exe /SILENT /DIR=C:\standalone\fastcopy /NODESK'
    - shell: cmd
    - require:
      - file: fastcopy-download
