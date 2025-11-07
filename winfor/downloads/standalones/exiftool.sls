# Name: ExifTool
# Website: https://exiftool.org
# Description: Tool for analysing EXIF data from files
# Category: Documents / Editors
# Author: Phil Harvey
# License: https://exiftool.org/#license
# Version: 13.41
# Notes:

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
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

exiftool-download-only:
  file.managed:
    - name: '{{ downloads }}\exiftool\exiftool-{{ version }}_64.zip'
    - source: https://exiftool.org/exiftool-{{ version }}_64.zip
    - source_hash: sha256={{ ns.exiftool_hash }}
    - makedirs: True
