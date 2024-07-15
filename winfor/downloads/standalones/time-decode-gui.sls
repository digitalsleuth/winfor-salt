# Name: Time Decode GUI
# Website: https://github.com/digitalsleuth/time_decode
# Description: Python 3 timestamp decode / encode tool
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/time_decode/blob/master/LICENSE)
# Version: 8.0.0
# Notes:

{% set version = '8.0.0' %}
{% set hash = '4cd6a043259720fca2151a8db1bb71de90c3f5f5e3f974846ef79ea6f66f3dd4' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

time-decode-download-only:
  file.managed:
    - name: '{{ downloads }}\time-decode\Time Decode GUI v{{ version }}.exe'
    - source: https://github.com/digitalsleuth/time_decode/releases/download/v{{ version }}/Time.Decode.GUI.v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
