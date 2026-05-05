# Name: Cyberchef
# Website: https://github.com/gchq/cyberchef
# Description: Web app for encryption, encoding, compression and data analysis
# Category: Raw Parsers / Decoders
# Author: GCHQ
# License: Apache License v2.0 (https://github.com/gchq/CyberChef/blob/master/LICENSE)
# Version: 10.23.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set version = '10.23.0' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.offline.packages.firefox

cyberchef-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\cyberchef'
    - enforce_toplevel: False
    - source: '{{ downloads }}\cyberchef\CyberChef-v{{ version }}.zip'
    - skip_verify: True
    - overwrite: True
    - require:
      - sls: winfor.offline.packages.firefox

cyberchef-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\CyberChef.lnk'
    - target: 'C:\Program Files\Mozilla Firefox\firefox.exe'
    - arguments: '{{ inpath }}\cyberchef\CyberChef_v{{ version }}.html'
    - force: True
    - working_dir: 'C:\Program Files\Mozilla Firefox'
    - makedirs: True
    - require:
      - sls: winfor.offline.packages.firefox
      - archive: cyberchef-extract-offline
