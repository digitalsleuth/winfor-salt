# Name: Cyberchef
# Website: https://github.com/gchq/cyberchef
# Description: Web app for encryption, encoding, compression and data analysis
# Category: Raw Parsers / Decoders
# Author: GCHQ
# License: Apache License v2.0 (https://github.com/gchq/CyberChef/blob/master/LICENSE)
# Version: 10.23.0
# Notes: 

{% set version = '10.23.0' %}
{% set hash = '71dbd1c6a53cbe2c5f9eecb9698153f7c9b79137d4bcb4ad90d7db35d38c94ff' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

cyberchef-download-only:
  file.managed:
    - name: '{{ downloads }}\cyberchef\CyberChef-v{{ version }}.zip'
    - source: https://github.com/gchq/CyberChef/releases/download/v{{ version}}/CyberChef_v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
