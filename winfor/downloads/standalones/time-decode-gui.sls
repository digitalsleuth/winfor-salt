# Name: Time Decode GUI
# Website: https://github.com/digitalsleuth/time_decode
# Description: Python 3 timestamp decode / encode tool
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/time_decode/blob/master/LICENSE)
# Version: 9.0.0
# Notes:

{% set version = '9.0.0' %}
{% set hash = '6892d17e0f04454651ddbdb3c61d8fd88e0dfc86194dc6fa997b8af8688fd40f' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

time-decode-download-only:
  file.managed:
    - name: '{{ downloads }}\time-decode\Time Decode GUI v{{ version }}.exe'
    - source: https://github.com/digitalsleuth/time_decode/releases/download/v{{ version }}/Time.Decode.GUI.v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
