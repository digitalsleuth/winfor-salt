# Name: regripper
# Website: https://github.com/keydet89/RegRipper3.0
# Description: Registry parsing toolsuite
# Category: Registry
# Author: Harlan Carvey
# License: MIT License (https://github.com/keydet89/RegRipper3.0/blob/master/license.md)
# Version: 3.0
# Notes: rr.exe

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

regripper-download-only:
  git.latest:
    - name: https://github.com/keydet89/RegRipper3.0.git
    - target: '{{ downloads }}\regripper'
    - rev: master
    - force_clone: True
    - force_reset: True
