# Name: ExifTool
# Website: https://exiftool.org
# Description: Tool for analysing EXIF data from files
# Category: Document Analysis
# Author: Phil Harvey
# License: https://exiftool.org/#license
# Version: 12.42
# Notes:

{% set version = '12.42' %}
{% set hash = '3ca80ee5dfc8c52ab4378260507b7a776fbbb500410c44dfcfb0655b11f897c8' %}

exiftool-download:
  file.managed:
    - name: 'C:\salt\tempdownload\exiftool-{{ version }}.zip'
    - source: https://exiftool.org/exiftool-{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

exiftool-extract:
  archive.extracted:
    - name: 'C:\standalone\exiftool\'
    - source: 'C:\salt\tempdownload\exiftool-{{ version }}.zip'
    - enforce_toplevel: False
    - watch:
      - file: exiftool-download

exiftool-rename:
  file.rename:
    - name: 'C:\standalone\exiftool\exiftool.exe'
    - source: 'C:\standalone\exiftool\exiftool(-k).exe'
    - force: True
    - require:
      - archive: exiftool-extract

exiftool-env-vars:
  win_path.exists:
    - name: 'C:\standalone\exiftool\'
    - require:
      - file: exiftool-rename
