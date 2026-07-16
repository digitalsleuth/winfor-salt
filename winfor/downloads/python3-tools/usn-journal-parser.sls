# Name: USN Journal Parser
# Website: https://github.com/digitalsleuth/USN-Journal-Parser
# Description: Updated version of PoorBillionaire's USN-Journal-Parser
# Category: Windows Analysis
# Author: Corey Forman / Adam Witt
# License: MIT License (https://github.com/digitalsleuth/USN-Journal-Parser/blob/main/LICENSE)
# Version: 5.0.0
# Notes: Commands: usn, usn.py

{% set version = '5.0.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '00c0cb00f4bdc956c5d3ec420b6d5589f5418c13bfe0528ef6cf3bc38ee3ef21' %}

include:
  - winfor.standalones.portable-python3

usn-journal-parser-download-only:
  file.managed:
    - name: '{{ downloads }}\usn-journal-parser-{{ version }}.zip'
    - source: https://github.com/digitalsleuth/USN-Journal-Parser/archive/refs/heads/main.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

usn-journal-parser-extract-download-only:
  archive.extracted:
    - name: '{{ downloads }}\'
    - source: '{{ downloads }}\usn-journal-parser-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: usn-journal-parser-download-only

usn-journal-parser-rename-download-only:
  file.rename:
    - name: '{{ downloads }}\usn-journal-parser'
    - source: '{{ downloads }}\usn-journal-parser-main\'
    - makedirs: True
    - force: True
    - require:
      - archive: usn-journal-parser-extract-download-only

usn-journal-parser-python-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages .'
    - cwd: '{{ downloads }}\usn-journal-parser\'
    - require:
      - sls: winfor.standalones.portable-python3
      - archive: usn-journal-parser-extract-download-only

usn-journal-parser-remove-download-only:
  file.absent:
    - name: '{{ downloads }}\usn-journal-parser-{{ version }}.zip'
    - require:
      - archive: usn-journal-parser-extract-download-only
