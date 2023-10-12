# Name: ExifTool
# Website: https://exiftool.org
# Description: Tool for analysing EXIF data from files
# Category: Documents / Editors
# Author: Phil Harvey
# License: https://exiftool.org/#license
# Version: 12.67
# Notes:

{% set version = '12.67' %}
{% set hash = '6ec1ee420183c427d49289db15faad7a216d43cb53d2ae5d2885a6a2d50e4699' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

exiftool-download-only:
  file.managed:
    - name: '{{ downloads }}\exiftool\exiftool-{{ version }}.zip'
    - source: https://exiftool.org/exiftool-{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
