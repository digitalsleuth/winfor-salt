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
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'BitsParser.py' %}
{% set exists = salt['file.file_exists'](downloads + '\\bitsparser\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3

bitsparser-rename-offline:
  file.rename:
    - name: '{{ inpath }}\bitsparser'
    - source: '{{ downloads }}\bitsparser'
    - makedirs: True
    - force: True

bitsparser-requirements-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages -r requirements.txt'
    - cwd: '{{ inpath }}\bitsparser\'
    - require:
      - file: bitsparser-rename-offline

bitsparser-env-vars-offline:
  win_path.exists:
    - name: '{{ inpath }}\bitsparser\'
    - require:
      - cmd: bitsparser-requirements-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
