# Name: plaso (super timeline all the things)
# Website: https://plaso.readthedocs.io/en/latest/
# Description: Python 3 tool to generate a timeline of all artifacts
# Category: Acquisition and Analysis
# Author: https://github.com/log2timeline/plaso/blob/main/AUTHORS
# License: Apache License v2 (https://github.com/log2timeline/plaso/blob/main/LICENSE)
# Version: 20260512
# Notes: log2timeline.py, psort.py, psteal.py

{% set version = '20260512' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

include:
  - winfor.standalones.portable-python3

plaso-folder-download-only:
  file.directory:
    - name: '{{ downloads }}\plaso'
    - makedirs: True
    - force: True
    - win_inheritance: True

plaso-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages plaso setuptools wheel'
    - cwd: '{{ downloads }}\plaso\'
    - require:
      - sls: winfor.standalones.portable-python3
      - file: plaso-folder-download-only

