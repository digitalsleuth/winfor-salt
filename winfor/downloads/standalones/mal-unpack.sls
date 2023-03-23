# Name: mal_unpack
# Website: https://github.com/hasherezade/mal_unpack
# Description: Dynamic unpacker based on PE-sieve
# Category: Executables
# Author: hasherezade
# License: BSD 2-Clause Simplified License (https://github.com/hasherezade/mal_unpack/blob/master/LICENSE)
# Version: 0.9.6
# Notes: 

{% set version = '0.9.6' %}
{% set hash = 'ddb634f6b64caa847be8438f770d7f30fc37bb91d97c6e110198e5ff080caf63' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

mal-unpack-download-only:
  file.managed:
    - name: '{{ downloads }}\mal_unpack64.zip'
    - source: https://github.com/hasherezade/mal_unpack/releases/download/{{ version }}/mal_unpack64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
