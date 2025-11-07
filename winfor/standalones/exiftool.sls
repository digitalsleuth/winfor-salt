# Name: ExifTool
# Website: https://exiftool.org
# Description: Tool for analysing EXIF data from files
# Category: Documents / Editors
# Author: Phil Harvey
# License: https://exiftool.org/#license
# Version: 13.41
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version_query = salt['http.query']('https://exiftool.org/ver.txt', backend='requests', verify_ssl=True) %}
{% set version = version_query.get('body').strip() %}
{% set hash_query = salt['http.query']('https://exiftool.org/checksums.txt', backend='requests', verify_ssl=True) %}
{% set hash_content = hash_query.get('body').splitlines() %}
{% set ns = namespace(exiftool_hash='') %}
{% for line in hash_content %}
{% if 'SHA2-256(exiftool-' ~ version ~ '_64.zip)' in line %}
{% set ns.exiftool_hash = line.split()[-1].strip() %}
{% endif %}
{% endfor %}

exiftool-download:
  file.managed:
    - name: 'C:\salt\tempdownload\exiftool-{{ version }}_64.zip'
    - source: https://exiftool.org/exiftool-{{ version }}_64.zip
    - source_hash: sha256={{ ns.exiftool_hash }}
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
