# Name: scrcpy
# Website: https://github.com/Genymobile/scrcpy
# Description: Tool to mirror and graphically control Android devices over USB or TCP/IP
# Category: Mobile Analysis
# Author: Genymobile
# License: Apache License 2.0 (https://github.com/Genymobile/scrcpy/blob/master/LICENSE)
# Version: 3.2
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '3.2' %}
{% set hash = 'eaa27133e0520979873ba57ad651560a4cc2618373bd05450b23a84d32beafd0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

scrcpy-download-only:
  file.managed:
    - name: '{{ downloads }}\scrcpy\scrcpy-win64-v{{ version }}.zip'
    - source: https://github.com/Genymobile/scrcpy/releases/download/v{{ version }}/scrcpy-win64-v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
