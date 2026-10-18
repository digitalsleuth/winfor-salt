# Name: time-decode
# Website: https://github.com/digitalsleuth/time_decode
# Description: Python timestamp encode / decode utility
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/time_decode/blob/master/LICENSE)
# Version: 11.0.0
# Notes: 

# renovate: datasource=pypi depName=time-decode
{% set version = '11.0.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'time_decode-'~ version ~'-py3-none-any.whl' %}
{% set exists = salt['file.file_exists'](downloads + '\\time-decode\\packages\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3

time-decode-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages time-decode[gui]'
    - cwd: '{{ downloads }}\time-decode\'
    - require:
      - sls: winfor.offline.packages.python3

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
