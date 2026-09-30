# Name: Time Decode GUI
# Website: https://github.com/digitalsleuth/time_decode
# Description: Python 3 timestamp decode / encode tool
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/time_decode/blob/master/LICENSE)
# Version: 10.4.1
# Notes:

{% set version = '10.4.1' %}
{% set hash = 'fefa9f987c3bef7d331cb63047ca21893f2a538076efcfdc8ddb22294b0429ca' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

time-decode-download-only:
  file.managed:
    - name: '{{ downloads }}\time-decode\time-decode-gui-{{ version }}.exe'
    - source: https://github.com/digitalsleuth/time_decode/releases/download/v{{ version }}/Time.Decode.v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
