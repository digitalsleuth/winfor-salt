# Name: Time Decode GUI
# Website: https://github.com/digitalsleuth/time_decode
# Description: Python 3 timestamp decode / encode tool
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/time_decode/blob/master/LICENSE)
# Version: 7.0.2
# Notes:

{% set version = '7.0.2' %}
{% set hash = 'e4027ce0817774fbd15d1b315861231542c50c5d03eb30f457413818e706ea32' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

time-decode-download-only:
  file.managed:
    - name: '{{ downloads }}\time-decode\Time Decode GUI v{{ version }}.exe'
    - source: https://github.com/digitalsleuth/time_decode/releases/download/v{{ version }}/Time.Decode.GUI.v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
