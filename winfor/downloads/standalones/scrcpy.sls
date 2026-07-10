# Name: scrcpy
# Website: https://github.com/Genymobile/scrcpy
# Description: Tool to mirror and graphically control Android devices over USB or TCP/IP
# Category: Mobile Analysis
# Author: Genymobile
# License: Apache License 2.0 (https://github.com/Genymobile/scrcpy/blob/master/LICENSE)
# Version: 4.0
# Notes:

{% set version = '4.0' %}
{% set hash = '75dbeb5b00e6f64292f26f70900ae55ca397786bdfb0b9bbeb481a0549047457' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

scrcpy-download-only:
  file.managed:
    - name: '{{ downloads }}\scrcpy\scrcpy-{{ version }}.zip'
    - source: https://github.com/Genymobile/scrcpy/releases/download/v{{ version }}/scrcpy-win64-v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
