# Name: xsv
# Website: https://github.com/BurntSushi/xsv
# Description: Command Line CSV manipulator
# Category: Utilities
# Author: Andrew Gallant
# License: Dual License - MIT or UNLICENSE (https://github.com/BurntSushi/xsv/blob/master/UNLICENSE)
# Version: 0.13.0
# Notes: 

{% set version = '0.13.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('xsv') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

include:
  - winfor.config.shims

xsv-download:
  file.managed:
    - name: 'C:\salt\tempdownload\xsv-{{ version }}-x86_64-pc-windows-msvc.zip'
    - source: https://github.com/BurntSushi/xsv/releases/download/{{ version }}/xsv-{{ version }}-x86_64-pc-windows-msvc.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

xsv-extract:
  archive.extracted:
    - name: '{{ inpath }}\xsv\'
    - source: 'C:\salt\tempdownload\xsv-{{ version }}-x86_64-pc-windows-msvc.zip'
    - enforce_toplevel: False
    - require:
      - file: xsv-download

xsv-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\xsv\xsv.exe -OutPath {{ inpath }}\shims\xsv.exe'
    - require:
      - sls: winfor.config.shims
