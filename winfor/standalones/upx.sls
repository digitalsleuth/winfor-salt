# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

{% set version = '3.96' %}
{% set hash = 'a2655c66a547e2274474e54d7a373f1c28e96ded162c51b34651873691022184' %}

upx-download:
  file.managed:
    - name: 'C:\salt\tempdownload\upx-{{ version }}-win64.zip'
    - source: https://github.com/upx/upx/releases/download/v{{ version }}/upx-{{ version }}-win64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

upx-extract:
  archive.extracted:
    - name: 'C:\standalone\'
    - source: 'C:\salt\tempdownload\upx-{{ version }}-win64.zip'
    - enforce_toplevel: False
    - require:
      - file: upx-download

upx-folder-rename:
  file.rename:
    - name: 'C:\standalone\upx'
    - source: 'C:\standalone\upx-3.96-win64\'
    - force: True
    - makedirs: True
    - require:
      - archive: upx-extract

upx-env-vars:
  win_path.exists:
    - name: 'C:\standalone\upx'
