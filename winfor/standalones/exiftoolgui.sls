# Name: exiftoolgui
# Website: https://exiftool.org
# Description: Graphical EXIF analysis tool
# Category: Documents / Editors
# Author: Phil Harvey
# License: https://exiftool.org/#license
# Version: 5.16
# Notes:

{% set hash = '8A55DAAE8CBF342152A0CCE53792C5EEEC2F54C64F29CB94FD841674940F344F' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

exiftoolgui-download:
  file.managed:
    - name: 'C:\salt\tempdownload\exiftoolgui516.zip'
    - source: https://exiftool.org/gui/exiftoolgui516.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

exiftoolgui-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\exiftoolgui516.zip'
    - enforce_toplevel: False
    - require:
      - file: exiftoolgui-download

exiftoolgui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ExifTool GUI.lnk'
    - target: '{{ inpath }}\exiftoolgui\ExifToolGUI.exe'
    - force: True
    - working_dir: '{{ inpath }}\exiftoolgui\'
    - icon_locaton: '{{ inpath }}\exiftoolgui\ExifToolGUI.exe'
    - makedirs: True
    - require:
      - archive: exiftoolgui-extract
