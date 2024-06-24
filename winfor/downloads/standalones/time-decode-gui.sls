# Name: Time Decode GUI
# Website: https://github.com/digitalsleuth/time_decode
# Description: Python 3 timestamp decode / encode tool
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/time_decode/blob/master/LICENSE)
# Version: 7.1.0
# Notes:

{% set version = '7.1.0' %}
{% set hash = 'c7bbaa3149232ba01ec002a478cebcd2c8f59138977767784cd05d1c4f189c34' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

time-decode-download-only:
  file.managed:
    - name: '{{ downloads }}\time-decode\Time Decode GUI v{{ version }}.exe'
    - source: https://github.com/digitalsleuth/time_decode/releases/download/v{{ version }}/Time.Decode.GUI.v{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
