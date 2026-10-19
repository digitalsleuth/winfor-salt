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
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

xsv-download-only:
  file.managed:
    - name: '{{ downloads }}\xsv\xsv-{{ version }}.zip'
    - source: https://github.com/BurntSushi/xsv/releases/download/{{ version }}/xsv-{{ version }}-x86_64-pc-windows-msvc.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
