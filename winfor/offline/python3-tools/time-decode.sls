# Name: time-decode
# Website: https://github.com/digitalsleuth/time_decode
# Description: Python timestamp encode / decode utility
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/time_decode/blob/master/LICENSE)
# Version: 10.4.0
# Notes: 

{% set version = '10.4.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.offline.packages.python3

time-decode-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages time-decode'
    - cwd: '{{ downloads }}\time-decode\'
    - require:
      - sls: winfor.offline.packages.python3
