# Name: mal_unpack
# Website: https://github.com/hasherezade/mal_unpack
# Description: Dynamic unpacker based on PE-sieve
# Category: Executables
# Author: hasherezade
# License: BSD 2-Clause Simplified License (https://github.com/hasherezade/mal_unpack/blob/master/LICENSE)
# Version: 1.0
# Notes: 

{% set version = '1.0' %}
{% set hash = '2ff766297c088e6a24b2ff9d92a11fc7585fe8c8444668161cd1e9875fb373a1' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

mal-unpack-download-only:
  file.managed:
    - name: '{{ downloads }}\malunpack\mal_unpack64-{{ version }}.zip'
    - source: https://github.com/hasherezade/mal_unpack/releases/download/{{ version }}/mal_unpack64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
