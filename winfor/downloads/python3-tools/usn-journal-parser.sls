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

include:
  - winfor.standalones.portable-python3

usn-journal-parser-folder-download-only:
  file.directory:
    - name: '{{ downloads }}\usn-journal-parser'
    - makedirs: True
    - force: True
    - win_inheritance: True

usn-journal-parser-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages git+https://github.com/digitalsleuth/USN-Journal-Parser'
    - cwd: '{{ downloads }}\usn-journal-parser\'
    - require:
      - sls: winfor.standalones.portable-python3
      - file: usn-journal-parser-folder-download-only
