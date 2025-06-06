# Name: mal_unpack
# Website: https://github.com/hasherezade/mal_unpack
# Description: Dynamic unpacker based on PE-sieve
# Category: Executables
# Author: hasherezade
# License: BSD 2-Clause Simplified License (https://github.com/hasherezade/mal_unpack/blob/master/LICENSE)
# Version: 0.9.9
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '0.9.9' %}
{% set hash = '81b9e998dea96aaf6067b77a8faf26dc417a0ea7c768cb66a14563af54692bad' %}

mal-unpack-download:
  file.managed:
    - name: 'C:\salt\tempdownload\mal_unpack64.zip'
    - source: https://github.com/hasherezade/mal_unpack/releases/download/{{ version }}/mal_unpack64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

mal-unpack-extract:
  archive.extracted:
    - name: '{{ inpath }}\mal-unpack'
    - source: 'C:\salt\tempdownload\mal_unpack64.zip'
    - enforce_toplevel: False
    - require:
      - file: mal-unpack-download

mal-unpack-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\mal-unpack\'

