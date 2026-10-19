# Name: mal_unpack
# Website: https://github.com/hasherezade/mal_unpack
# Description: Dynamic unpacker based on PE-sieve
# Category: Executables
# Author: hasherezade
# License: BSD 2-Clause Simplified License (https://github.com/hasherezade/mal_unpack/blob/master/LICENSE)
# Version: 1.0
# Notes: 

{% set version = '1.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('mal-unpack') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

mal-unpack-download-only:
  file.managed:
    - name: '{{ downloads }}\mal-unpack\mal-unpack-{{ version }}.zip'
    - source: https://github.com/hasherezade/mal_unpack/releases/download/{{ version }}/mal_unpack64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
