# Name: HxD 
# Website: https://mh-nexus.de
# Description: Hex Editor
# Category: Raw Parsers / Decoders
# Author: Mael Horz
# License: https://mh-nexus.de/en/about.php
# Version: 2.5.0.0
# Notes:

{% set version = '2.5.0.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('hxd') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

hxd-download-only:
  file.managed:
    - name: '{{ downloads }}\hxd\hxd-{{ version }}.zip'
    - source: https://mh-nexus.de/downloads/HxDSetup.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
