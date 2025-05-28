# Name: Time Decode GUI
# Website: https://github.com/digitalsleuth/time_decode
# Description: Python 3 timestamp decode / encode tool
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/time_decode/blob/master/LICENSE)
# Version: 10.1.0
# Notes:

{% set version = '10.1.0' %}
{% set hash = 'c360294d9a26323767bfd98c716a43e9aba8fdaa1295eca1531477619fd0f176' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

time-decode-download-only:
  file.managed:
    - name: '{{ downloads }}\time-decode\Time Decode GUI v{{ version }}.exe'
    - source: https://github.com/digitalsleuth/time_decode/releases/download/v{{ version }}/Time.Decode.v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
