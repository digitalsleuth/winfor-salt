# Name: Cyberchef
# Website: https://github.com/gchq/cyberchef
# Description: Web app for encryption, encoding, compression and data analysis
# Category: Raw Parsers / Decoders
# Author: GCHQ
# License: Apache License v2.0 (https://github.com/gchq/CyberChef/blob/master/LICENSE)
# Version: 10.5.2
# Notes: 

{% set version = '10.5.2' %}
{% set hash = 'a4d47a313d9e79d08775abfde18a08c32b50b4db8fa52261bfddbb785910d0ef' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

cyberchef-download-only:
  file.managed:
    - name: '{{ downloads }}\cyberchef\CyberChef_v{{ version }}.zip'
    - source: https://github.com/gchq/CyberChef/releases/download/v{{ version}}/CyberChef_v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
