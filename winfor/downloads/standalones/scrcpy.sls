# Name: scrcpy
# Website: https://github.com/Genymobile/scrcpy
# Description: Tool to mirror and graphically control Android devices over USB or TCP/IP
# Category: Mobile Analysis
# Author: Genymobile
# License: Apache License 2.0 (https://github.com/Genymobile/scrcpy/blob/master/LICENSE)
# Version: 5.0.1
# Notes:

{% set version = '5.0.1' %}
{% set hash = 'b12a2c4ee8be317422451fc7dcf8ee20a71b5ea7ef9ad73ddd825a25316227a5' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

scrcpy-download-only:
  file.managed:
    - name: '{{ downloads }}\scrcpy\scrcpy-{{ version }}.zip'
    - source: https://github.com/Genymobile/scrcpy/releases/download/v{{ version }}/scrcpy-win64-v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
