# Name: Time Decode GUI
# Website: https://github.com/digitalsleuth/time_decode
# Description: Python 3 timestamp decode / encode tool
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/time_decode/blob/master/LICENSE)
# Version: 10.4.2
# Notes:

{% set version = '10.4.2' %}
{% set hash = '99f8a1ff9729b1b8ce56faef99a91e2c10df361846d41624298fb3617f6aa35a' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

time-decode-download-only:
  file.managed:
    - name: '{{ downloads }}\time-decode\time-decode-gui-{{ version }}.exe'
    - source: https://github.com/digitalsleuth/time_decode/releases/download/v{{ version }}/Time.Decode.v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
