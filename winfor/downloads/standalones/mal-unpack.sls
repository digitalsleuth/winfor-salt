# Name: mal_unpack
# Website: https://github.com/hasherezade/mal_unpack
# Description: Dynamic unpacker based on PE-sieve
# Category: Executables
# Author: hasherezade
# License: BSD 2-Clause Simplified License (https://github.com/hasherezade/mal_unpack/blob/master/LICENSE)
# Version: 0.9.7
# Notes: 

{% set version = '0.9.7' %}
{% set hash = '3e33c60584e7d3df759d96f4b974e7b683288d9666f9fea266e0448706fe47c2' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

mal-unpack-download-only:
  file.managed:
    - name: '{{ downloads }}\malunpack\mal_unpack64-{{ version }}.zip'
    - source: https://github.com/hasherezade/mal_unpack/releases/download/{{ version }}/mal_unpack64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
