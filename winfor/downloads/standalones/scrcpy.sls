# Name: scrcpy
# Website: https://github.com/Genymobile/scrcpy
# Description: Tool to mirror and graphically control Android devices over USB or TCP/IP
# Category: Mobile Analysis
# Author: Genymobile
# License: Apache License 2.0 (https://github.com/Genymobile/scrcpy/blob/master/LICENSE)
# Version: 2.1.1
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '2.1.1' %}
{% set hash = 'f77281e1bce2f9934617699c581f063d5b327f012eff602ee98fb2ef550c25c2' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

scrcpy-download-only:
  file.managed:
    - name: '{{ downloads }}\scrcpy\scrcpy-win64-v{{ version }}.zip'
    - source: https://github.com/Genymobile/scrcpy/releases/download/v{{ version }}/scrcpy-win64-v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
