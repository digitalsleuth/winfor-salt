# Name: ExifTool
# Website: https://exiftool.org
# Description: Tool for analysing EXIF data from files
# Category: Documents / Editors
# Author: Phil Harvey
# License: https://exiftool.org/#license
# Version: 12.90
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '12.90' %}
{% set hash = 'd217e0ae8bdd8734be654ab9d50c863ca6ede72a20ad9e4c9fe244da58f1e269' %}

exiftool-download:
  file.managed:
    - name: 'C:\salt\tempdownload\exiftool-{{ version }}_64.zip'
    - source: https://exiftool.org/exiftool-{{ version }}_64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

exiftool-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\exiftool-{{ version }}_64.zip'
    - enforce_toplevel: False
    - watch:
      - file: exiftool-download

exiftool-folder-rename:
  file.rename:
    - name: '{{ inpath }}\exiftool'
    - source: '{{ inpath }}\exiftool-{{ version }}_64'
    - force: True
    - require:
      - archive: exiftool-extract

exiftool-rename:
  file.rename:
    - name: '{{ inpath }}\exiftool\exiftool.exe'
    - source: '{{ inpath }}\exiftool\exiftool(-k).exe'
    - force: True
    - require:
      - archive: exiftool-extract
      - file: exiftool-folder-rename

exiftool-kml-fmt:
  file.managed:
    - name: '{{ inpath }}\exiftool\kml.fmt'
    - source: salt://winfor/files/kml.fmt
    - makedirs: True

exiftool-kml-batch:
  file.managed:
    - name: '{{ inpath }}\exiftool\exif_kml.bat'
    - source: salt://winfor/files/exif_kml.bat
    - makedirs: True

exiftool-kml-batch-placeholder:
  file.replace:
    - name: '{{ inpath }}\exiftool\exif_kml.bat'
    - pattern: PLACEHOLDER_PATH
    - repl: {{ inpath | regex_escape }}
    - require:
      - file: exiftool-kml-batch

exiftool-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\exiftool\'
    - require:
      - file: exiftool-rename
