# Name: deark
# Website: https://entropymine.com/deark/
# Description: Portable command-line utility to decode file types
# Category: Raw Parsers / Decoders
# Author: Jason Summers
# License: MIT (https://github.com/jsummers/deark/blob/master/COPYING)
# Version: 1.7.3
# Notes: 

{% set version = '1.7.3' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '84f9e0134830389e4ab12c89dc09cf42a3f885ec551254e9fdc22952858add11' %}

deark-download-only:
  file.managed:
    - name: '{{ downloads }}\deark\deark-{{ version }}.tar.gz'
    - source: https://entropymine.com/deark/releases/deark-{{ version }}.tar.gz
    - source_hash: sha256={{ hash }}
    - makedirs: True
