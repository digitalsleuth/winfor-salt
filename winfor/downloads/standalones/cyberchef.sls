# Name: Cyberchef
# Website: https://github.com/gchq/cyberchef
# Description: Web app for encryption, encoding, compression and data analysis
# Category: Raw Parsers / Decoders
# Author: GCHQ
# License: Apache License v2.0 (https://github.com/gchq/CyberChef/blob/master/LICENSE)
# Version: 11.5.0
# Notes: 

{% set version = '11.5.0' %}
{% set hash = 'f6478925d3eaa16ec08626a85f5b85eed10d531a5e18700615fed7ecb024cccf' %}
{% set commit = '8cd426dd4f40f1423912d5fad91b578a86a65112' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

cyberchef-download-only:
  file.managed:
    - name: '{{ downloads }}\cyberchef\cyberchef-{{ version }}.zip'
    - source: https://github.com/gchq/CyberChef/releases/download/v{{ version }}/CyberChef_{{ commit }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
