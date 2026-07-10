# Name: USN Journal Parser
# Website: https://github.com/digitalsleuth/USN-Journal-Parser
# Description: Updated version of PoorBillionaire's USN-Journal-Parser
# Category: Windows Analysis
# Author: Corey Forman / Adam Witt
# License: MIT License (https://github.com/digitalsleuth/USN-Journal-Parser/blob/main/LICENSE)
# Version: 5.0.0
# Notes: Commands: usn, usn.py

{% set version = '5.0.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'usnparser-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\usn-journal-parser\\packages\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3

usn-journal-parser-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages usnparser'
    - cwd: '{{ downloads }}\usn-journal-parser\'
    - require:
      - sls: winfor.offline.packages.python3

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
