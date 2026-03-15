# Name: deark
# Website: https://entropymine.com/deark/
# Description: Portable command-line utility to decode file types
# Category: Raw Parsers / Decoders
# Author: Jason Summers
# License: MIT (https://github.com/jsummers/deark/blob/master/COPYING)
# Version: 1.7.2
# Notes: 

{% set version = '1.7.2' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'e2163169b18781425e87566abf21a235513cef457a4bd27c14c304cf9a872971' %}

deark-download-only:
  file.managed:
    - name: '{{ downloads }}\deark\deark-{{ version }}.tar.gz'
    - source: https://entropymine.com/deark/releases/deark-{{ version }}.tar.gz
    - source_hash: sha256={{ hash }}
    - makedirs: True
