# Name: Hex2GUID
# Website: (nil - in house)
# Description: Batch script to convert hex/on-disk GUID to GUID format
# Category: Utilities
# Author: Mark Southby
# License: Free To Use
# Version: 2022050a
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2022050a' %}

hex2guid-cmd-download-only:
  file.managed:
    - name: '{{ downloads }}\hex2guid\hex2guid.cmd'
    - source: salt://winfor/files/HEX2GUID.cmd
    - makedirs: True
