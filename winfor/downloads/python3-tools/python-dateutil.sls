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
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

include:
  - winfor.standalones.portable-python3

python-dateutil-folder-download-only:
  file.directory:
    - name: '{{ downloads }}\python-dateutil'
    - makedirs: True
    - force: True
    - win_inheritance: True
    - require:
      - sls: winfor.standalones.portable-python3

python-dateutil-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages python-dateutil'
    - cwd: '{{ downloads }}\python-dateutil'
    - require:
      - sls: winfor.standalones.portable-python3
