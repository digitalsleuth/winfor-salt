# Name: ExifTool
# Website: https://exiftool.org
# Description: Tool for analysing EXIF data from files
# Category: Documents / Editors
# Author: Phil Harvey
# License: https://exiftool.org/#license
# Version: 12.90
# Notes:

{% set version = '12.90' %}
{% set hash = 'd217e0ae8bdd8734be654ab9d50c863ca6ede72a20ad9e4c9fe244da58f1e269' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

exiftool-download-only:
  file.managed:
    - name: '{{ downloads }}\exiftool\exiftool-{{ version }}_64.zip'
    - source: https://exiftool.org/exiftool-{{ version }}_64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
