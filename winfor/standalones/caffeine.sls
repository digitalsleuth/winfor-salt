# Name: Caffeine
# Website: https://www.zhornsoftware.co.uk
# Description: Mouse Jiggling Software
# Category: Utilities
# Author: Tom Revell
# License: Free
# Version: 1.98
# Notes: 32-bit and 64-bit executables, execute from command line for additional parameters

{% set hash = '4a259c348e59eb51bbb75aac7fdcc798705496d575892ee1e01fff6970d5ba1c' %}
{% set version = '1.98' %}
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
