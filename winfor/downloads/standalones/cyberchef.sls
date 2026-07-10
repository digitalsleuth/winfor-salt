# Name: Cyberchef
# Website: https://github.com/gchq/cyberchef
# Description: Web app for encryption, encoding, compression and data analysis
# Category: Raw Parsers / Decoders
# Author: GCHQ
# License: Apache License v2.0 (https://github.com/gchq/CyberChef/blob/master/LICENSE)
# Version: 11.2.0
# Notes: 

{% set version = '11.2.0' %}
{% set hash = '9abbe74b94af3423b4e0e6d064cf5142df01c5e89d6b222e412fd6f4daf906ac' %}
{% set commit = 'd358d82cbcb269d764a2deb598a37043bd054f45' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

cyberchef-download-only:
  file.managed:
    - name: '{{ downloads }}\cyberchef\cyberchef-{{ version }}.zip'
    - source: https://github.com/gchq/CyberChef/releases/download/v{{ version }}/CyberChef_{{ commit }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
