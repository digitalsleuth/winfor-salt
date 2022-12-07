# Name: Cyberchef
# Website: https://github.com/gchq/cyberchef
# Description: Web app for encryption, encoding, compression and data analysis
# Category: Raw Parsers / Decoders
# Author: GCHQ
# License: Apache License v2.0 (https://github.com/gchq/CyberChef/blob/master/LICENSE)
# Version: 9.54.0
# Notes: 

{% set version = '9.54.0' %}
{% set hash = 'bfdc7232666a91df84dd41efd03052497eeae2140fc73240f58bcea939f89887' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.firefox

winfor-standalones-cyberchef:
  archive.extracted:
    - name: 'C:\standalone\cyberchef'
    - enforce_toplevel: False
    - source: https://github.com/gchq/CyberChef/releases/download/v{{ version}}/CyberChef_v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - overwrite: True
    - require:
      - sls: winfor.packages.firefox

winfor-standalones-cyberchef-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\CyberChef.lnk'
    - target: 'C:\Program Files\Mozilla Firefox\firefox.exe'
    - arguments: 'C:\standalone\cyberchef\CyberChef_v{{ version }}.html'
    - force: True
    - working_dir: 'C:\Program Files\Mozilla Firefox'
    - makedirs: True
    - require:
      - sls: winfor.packages.firefox
      - archive: winfor-standalones-cyberchef
