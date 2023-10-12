# Name: exiftoolgui
# Website: https://exiftool.org
# Description: Graphical EXIF analysis tool
# Category: Documents / Editors
# Author: Phil Harvey
# License: https://exiftool.org/#license
# Version: 5.16
# Notes:

{% set hash = '8A55DAAE8CBF342152A0CCE53792C5EEEC2F54C64F29CB94FD841674940F344F' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '5.16' %}

exiftoolgui-download-only:
  file.managed:
    - name: '{{ downloads }}\exiftool\exiftoolgui516.zip'
    - source: https://exiftool.org/gui/exiftoolgui516.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
