# Name: UPX
# Website: https://github.com/upx/upx
# Description: The Ultimate Packer for eXecutables
# Category: Executables
# Author: Markus Oberhumer, Laszlo Molnar, John Reiser
# License: Multiple Licenses (https://github.com/upx/upx/blob/devel/LICENSE)
# Version: 5.2.1
# Notes: 

{% set version = '5.2.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('upx') %}

upx-download:
  file.managed:
    - name: 'C:\salt\tempdownload\upx-{{ version }}-win64.zip'
    - source: https://github.com/upx/upx/releases/download/v{{ version }}/upx-{{ version }}-win64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

upx-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\upx-{{ version }}-win64.zip'
    - enforce_toplevel: False
    - require:
      - file: upx-download

upx-folder-rename:
  file.rename:
    - name: '{{ inpath }}\upx'
    - source: '{{ inpath }}\upx-{{ version }}-win64\'
    - force: True
    - makedirs: True
    - require:
      - archive: upx-extract

upx-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\upx'
