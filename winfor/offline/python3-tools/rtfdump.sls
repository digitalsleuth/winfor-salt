# Name: rtfdump.py
# Website: https://github.com/didierstevens/didierstevenssuite
# Description: Analyze RTF files
# Category: Documents / Editors
# Author: Didier Stevens
# License: Public Domain
# Version: 0.0.15
# Notes: 

{% set version = '0.0.15' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set files = ['rtfdump.py','rtf.yara'] %}

include:
  - winfor.offline.packages.python3
  - winfor.offline.python3-tools.yara-python

{% for file in files %}
rtfdump-manage-{{ file }}-offline:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\{{ file }}'
    - source: '{{ downloads }}\rtfdump\{{ file }}'
    - skip_verify: True
    - makedirs: True
{% endfor %}

rtfdump-wrapper-offline:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\rtfdump.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - '"C:\Program Files\Python310\python.exe" "C:\Program Files\Python310\Scripts\rtfdump.py" %*'
    - require:
      - file: rtfdump-manage-rtfdump.py-offline
