# Name: python-dateutil
# Website: https://github.com/dateutil/dateutil
# Description: Python module to use standard datetime features
# Category: Requirements
# Author: https://github.com/dateutil/dateutil/blob/master/AUTHORS.md
# License: Apache License v2.0 (https://github.com/dateutil/dateutil/blob/master/LICENSE)
# Version: 2.8.2
# Notes: 

{% set version = '2.8.2' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.offline.packages.python3

python-dateutil-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages python-dateutil'
    - cwd: '{{ downloads }}\python-dateutil\'
    - require:
      - sls: winfor.offline.packages.python3