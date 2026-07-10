# Name: time-decode
# Website: https://github.com/digitalsleuth/time_decode
# Description: Python timestamp encode / decode utility
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: MIT License (https://github.com/digitalsleuth/time_decode/blob/master/LICENSE)
# Version: 10.4.0
# Notes:

{% set version = '10.4.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

include:
  - winfor.downloads.packages.python3
  - winfor.standalones.portable-python3

time-decode-python-folder-download-only:
  file.directory:
    - name: '{{ downloads }}\time-decode'
    - makedirs: True
    - force: True
    - win_inheritance: True

time-decode-python-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages time-decode'
    - cwd: '{{ downloads }}\time-decode\'
    - require:
      - sls: winfor.standalones.portable-python3
      - file: time-decode-python-folder-download-only
