# Name: Cyberchef
# Website: https://github.com/gchq/cyberchef
# Description: Web app for encryption, encoding, compression and data analysis
# Category: Raw Parsers / Decoders
# Author: GCHQ
# License: Apache License v2.0 (https://github.com/gchq/CyberChef/blob/master/LICENSE)
# Version: 11.5.0
# Notes: 

{% set version = '11.5.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = 'f6478925d3eaa16ec08626a85f5b85eed10d531a5e18700615fed7ecb024cccf' %}
{% set commit = '8cd426dd4f40f1423912d5fad91b578a86a65112' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.firefox

cyberchef-extract:
  archive.extracted:
    - name: '{{ inpath }}\cyberchef'
    - enforce_toplevel: False
    - source: https://github.com/gchq/CyberChef/releases/download/v{{ version}}/CyberChef_{{ commit }}.zip
    - source_hash: sha256={{ hash }}
    - overwrite: True
    - require:
      - sls: winfor.packages.firefox

cyberchef-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\CyberChef.lnk'
    - target: 'C:\Program Files\Mozilla Firefox\firefox.exe'
    - arguments: '{{ inpath }}\cyberchef\CyberChef_v{{ version }}.html'
    - force: True
    - working_dir: 'C:\Program Files\Mozilla Firefox'
    - makedirs: True
    - require:
      - sls: winfor.packages.firefox
      - archive: cyberchef-extract
