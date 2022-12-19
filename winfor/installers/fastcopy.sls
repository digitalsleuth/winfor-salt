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
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

fastcopy-download:
  file.managed:
    - name: 'C:\salt\tempdownload\FastCopy{{ version }}_installer.exe'
    - source: https://github.com/FastCopyLab/FastCopyDist/raw/main/FastCopy{{ version }}_installer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

fastcopy-install:
  cmd.run:
    - name: 'C:\salt\tempdownload\FastCopy{{ version }}_installer.exe /SILENT /DIR=C:\standalone\fastcopy /NODESK /NOPROG'
    - shell: cmd
    - require:
      - file: fastcopy-download

winfor-standalones-fastcopy-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\FastCopy.lnk'
    - target: 'C:\standalone\fastcopy\FastCopy.exe'
    - force: True
    - working_dir: 'C:\standalone\fastcopy\'
    - makedirs: True
    - require:
      - cmd: fastcopy-install
