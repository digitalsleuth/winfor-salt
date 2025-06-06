# Name: ExifTool
# Website: https://exiftool.org
# Description: Tool for analysing EXIF data from files
# Category: Documents / Editors
# Author: Phil Harvey
# License: https://exiftool.org/#license
# Version: 13.30
# Notes:

{% set version = '13.30' %}
{% set hash = '016f1562fdd70da8e90657575cc68048f95571691a2cadf3ee07acbc31a5b3f7' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

exiftool-download-only:
  file.managed:
    - name: '{{ downloads }}\exiftool\exiftool-{{ version }}_64.zip'
    - source: https://exiftool.org/exiftool-{{ version }}_64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
