# Name: Hex2GUID
# Website: (nil - in house)
# Description: Batch script to convert hex/on-disk GUID to GUID format
# Category: Utilities
# Author: Mark Southby
# License: Free To Use
# Version: 2022050a
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

hex2guid-cmd:
  file.managed:
    - name: '{{ inpath }}\hex2guid\hex2guid.cmd'
    - source: salt://winfor/files/HEX2GUID.cmd
    - makedirs: True

hex2guid-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\hex2guid\'
    - require:
      - file: hex2guid-cmd
