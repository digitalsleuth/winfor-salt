# Name: Cyberchef
# Website: https://github.com/gchq/cyberchef
# Description: Web app for encryption, encoding, compression and data analysis
# Category: Raw Parsers / Decoders
# Author: GCHQ
# License: Apache License v2.0 (https://github.com/gchq/CyberChef/blob/master/LICENSE)
# Version: 11.2.0
# Notes: 

{% set version = '11.2.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'cyberchef-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\cyberchef\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.firefox

cyberchef-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\cyberchef'
    - source: '{{ downloads }}\cyberchef\{{ pkg }}'
    - enforce_toplevel: False
    - overwrite: True
    - require:
      - sls: winfor.offline.packages.firefox

cyberchef-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\CyberChef.lnk'
    - target: 'C:\Program Files\Mozilla Firefox\firefox.exe'
    - arguments: '{{ inpath }}\cyberchef\CyberChef_v{{ version }}.html'
    - working_dir: 'C:\Program Files\Mozilla Firefox'
    - force: True
    - makedirs: True
    - require:
      - sls: winfor.offline.packages.firefox
      - archive: cyberchef-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
