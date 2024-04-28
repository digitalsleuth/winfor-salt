# Name: Caffeine
# Website: https://www.zhornsoftware.co.uk
# Description: Mouse Jiggling Software
# Category: Utilities
# Author: Tom Revell
# License: Free
# Version: 1.97
# Notes: 32-bit and 64-bit executables, execute from command line for additional parameters

{% set hash = '083b16e4100e7a59f8ac5094938a88da47b2547f5b9eac21cc55c96ad9200585' %}
{% set version = '1.97' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

caffeine-download:
  file.managed:
    - name: 'C:\salt\tempdownload\caffeine.zip'
    - source: https://www.zhornsoftware.co.uk/caffeine/caffeine.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

caffeine-archive-extract:
  archive.extracted:
    - name: '{{ inpath }}\caffeine\'
    - source: 'C:\salt\tempdownload\caffeine.zip'
    - overwrite: True
    - enforce_toplevel: False
    - require:
      - file: caffeine-download
