# Name: xsv
# Website: https://github.com/BurntSushi/xsv
# Description: Command Line CSV manipulator
# Category: Utilities
# Author: Andrew Gallant
# License: Dual License - MIT or UNLICENSE (https://github.com/BurntSushi/xsv/blob/master/UNLICENSE)
# Version: 0.13.0
# Notes: 

{% set version = '0.13.0' %}
{% set hash = '3e319c08456031a9683c19c998ac9f61756a2e456413db17c8e6819b17818a1a' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

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

xsv-env:
  win_path.exists:
    - name: '{{ inpath }}\xsv\'
    - require:
      - archive: xsv-extract
