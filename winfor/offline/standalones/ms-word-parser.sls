# Name: MS Word Parser
# Website: https://github.com/jjrboucher/MS-Word-Parser
# Description: MS Word document analysis tool
# Category: Documents / Editors
# Author: Jacques Boucher (jjrboucher) / Corey Forman (digitalsleuth)
# License: MIT License (https://github.com/jjrboucher/MS-Word-Parser/blob/master/LICENSE)
# Version: 3.0.1
# Notes: 

{% set version = '3.0.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'ms-word-parser-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\ms-word-parser\\' + pkg) %}

{% if exists %}

ms-word-parser-offline:
  file.managed:
    - name: '{{ inpath }}\ms-word-parser\ms-word-parser.exe'
    - source: '{{ downloads }}\ms-word-parser\{{ pkg }}'
    - skip_verify: True
    - makedirs: True

ms-word-parser-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\MS Word Parser.lnk'
    - target: '{{ inpath }}\ms-word-parser\ms-word-parser.exe'
    - force: True
    - working_dir: '{{ inpath }}\ms-word-parser\'
    - makedirs: True
    - require:
      - file: ms-word-parser-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
