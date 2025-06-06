# Name: mal_unpack
# Website: https://github.com/hasherezade/mal_unpack
# Description: Dynamic unpacker based on PE-sieve
# Category: Executables
# Author: hasherezade
# License: BSD 2-Clause Simplified License (https://github.com/hasherezade/mal_unpack/blob/master/LICENSE)
# Version: 0.9.9
# Notes: 

{% set version = '0.9.9' %}
{% set hash = '81b9e998dea96aaf6067b77a8faf26dc417a0ea7c768cb66a14563af54692bad' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

mal-unpack-download-only:
  file.managed:
    - name: '{{ downloads }}\malunpack\mal_unpack64-{{ version }}.zip'
    - source: https://github.com/hasherezade/mal_unpack/releases/download/{{ version }}/mal_unpack64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
