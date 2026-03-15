# Name: scrcpy
# Website: https://github.com/Genymobile/scrcpy
# Description: Tool to mirror and graphically control Android devices over USB or TCP/IP
# Category: Mobile Analysis
# Author: Genymobile
# License: Apache License 2.0 (https://github.com/Genymobile/scrcpy/blob/master/LICENSE)
# Version: 3.3.4
# Notes:

{% set version = '3.3.4' %}
{% set hash = 'd8a155b7c180b7ca4cdadd40712b8750b63f3aab48cb5b8a2a39ac2d0d4c5d38' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

scrcpy-download-only:
  file.managed:
    - name: '{{ downloads }}\scrcpy\scrcpy-win64-v{{ version }}.zip'
    - source: https://github.com/Genymobile/scrcpy/releases/download/v{{ version }}/scrcpy-win64-v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
