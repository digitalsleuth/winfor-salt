# Name: plaso (super timeline all the things)
# Website: https://plaso.readthedocs.io/en/latest/
# Description: Python 3 tool to generate a timeline of all artifacts
# Category: Acquisition and Analysis
# Author: https://github.com/log2timeline/plaso/blob/main/AUTHORS
# License: Apache License v2 (https://github.com/log2timeline/plaso/blob/main/LICENSE)
# Version: 20260512
# Notes: log2timeline.py, psort.py, psteal.py

{% set version = '20260512' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.offline.packages.python3

plaso-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages plaso'
    - cwd: '{{ downloads }}\plaso\'
    - require:
      - sls: winfor.offline.packages.python3
