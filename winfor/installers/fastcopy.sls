# Name: FastCopy
# Website: https://fastcopy.jp
# Description: Fast file copy software which can retain file details
# Category: Utilities
# Author: FastCopy Lab - https://fastcopy.jp/company.html
# License: Copyright - All rights reserved - https://fastcopy.jp/help/fastcopy_eng.htm#license
# Version: 5.0.0
# Notes:

{% set version = '5.0.0' %}
{% set hash = '1057abaf6d3aa736c141787699f92fef68e80621836fcf28cdbc85efd80e7137' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

fastcopy-download:
  file.managed:
    - name: 'C:\salt\tempdownload\FastCopy{{ version }}_installer.exe'
    - source: https://github.com/FastCopyLab/FastCopyDist2/raw/main/FastCopy{{ version }}_installer.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

fastcopy-install:
  cmd.run:
    - name: 'C:\salt\tempdownload\FastCopy{{ version }}_installer.exe /SILENT /DIR={{ inpath }}\fastcopy /NODESK /NOPROG'
    - shell: cmd
    - require:
      - file: fastcopy-download

standalones-fastcopy-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\FastCopy.lnk'
    - target: '{{ inpath }}\fastcopy\FastCopy.exe'
    - force: True
    - working_dir: '{{ inpath }}\fastcopy\'
    - makedirs: True
    - require:
      - cmd: fastcopy-install
