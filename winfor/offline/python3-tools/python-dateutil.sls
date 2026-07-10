# Name: python-dateutil
# Website: https://github.com/dateutil/dateutil
# Description: Python module to use standard datetime features
# Category: Requirements
# Author: https://github.com/dateutil/dateutil/blob/master/AUTHORS.md
# License: Apache License v2.0 (https://github.com/dateutil/dateutil/blob/master/LICENSE)
# Version: 2.9.0.post0
# Notes: 

{% set version = '2.9.0.post0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'python_dateutil-'~ version ~'-py2.py3-none-any.whl' %}
{% set exists = salt['file.file_exists'](downloads + '\\python-dateutil\\packages\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3

python-dateutil-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages python-dateutil'
    - cwd: '{{ downloads }}\python-dateutil\'
    - require:
      - sls: winfor.offline.packages.python3

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
