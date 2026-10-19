# Name: Cyberchef
# Website: https://github.com/gchq/cyberchef
# Description: Web app for encryption, encoding, compression and data analysis
# Category: Raw Parsers / Decoders
# Author: GCHQ
# License: Apache License v2.0 (https://github.com/gchq/CyberChef/blob/master/LICENSE)
# Version: 11.5.0
# Notes: 

{% set version = '11.5.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('cyberchef') %}
{% set commit = get_hash('cyberchef', 'commit') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

cyberchef-download-only:
  file.managed:
    - name: '{{ downloads }}\cyberchef\cyberchef-{{ version }}.zip'
    - source: https://github.com/gchq/CyberChef/releases/download/v{{ version }}/CyberChef_{{ commit }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
