# Name: Caffeine
# Website: https://www.zhornsoftware.co.uk
# Description: Mouse Jiggling Software
# Category: Utilities
# Author: Tom Revell
# License: Free
# Version: 1.98
# Notes: 32-bit and 64-bit executables, execute from command line for additional parameters

{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('caffeine') %}
{% set version = '1.98' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

caffeine-download-only:
  file.managed:
    - name: '{{ downloads }}\caffeine\caffeine-{{ version }}.zip'
    - source: https://www.zhornsoftware.co.uk/caffeine/caffeine.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
