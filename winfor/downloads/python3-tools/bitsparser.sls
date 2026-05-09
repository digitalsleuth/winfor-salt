# Name: bitsparser
# Website: https://github.com/digitalsleuth/bitsparser
# Description: A python tool to parse Windows BITS database files
# Category: Windows Analysis
# Author: Corey Forman / FireEye
# License: Apache License v2.0 (https://github.com/digitalsleuth/BitsParser/blob/master/LICENSE)
# Version: 1.0
# Notes:

{% set version = '1.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'e0b8581246db00a3882765a65722a326d0e5d347986e284ca351c7ce0c2fc092' %}

include:
  - winfor.standalones.portable-python3

bitsparser-download-only:
  file.managed:
    - name: '{{ downloads }}\bitsparser-{{ version }}.zip'
    - source: https://github.com/digitalsleuth/BitsParser/archive/refs/heads/main.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

bitsparser-extract-download-only:
  archive.extracted:
    - name: '{{ downloads }}\'
    - source: '{{ downloads }}\bitsparser-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: bitsparser-download-only

bitsparser-folder-rename-download-only:
  file.rename:
    - name: '{{ downloads }}\bitsparser'
    - source: '{{ downloads }}\BitsParser-main'
    - makedirs: True
    - force: True

bitsparser-requirements-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -r requirements.txt -d packages'
    - cwd: '{{ downloads }}\bitsparser'
    - require:
      - sls: winfor.standalones.portable-python3
      - archive: bitsparser-extract-download-only

bitsparser-delete-archive-download-only:
  file.absent:
    - name: '{{ downloads }}\bitsparser-{{ version }}.zip'
    - require:
      - file: bitsparser-download-only
      - archive: bitsparser-extract-download-only
      - cmd: bitsparser-requirements-download-only
