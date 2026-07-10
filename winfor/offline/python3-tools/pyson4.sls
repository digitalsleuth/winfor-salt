# Name: pyson4
# Website: https://github.com/digitalsleuth/pyson4
# Description: A python3 jsonlz4 file parser for Firefox
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: GNU General Public License v3 (https://github.com/digitalsleuth/pyson4/blob/master/LICENSE)
# Version: 1.2.0
# Notes: pyson4, pyson4.py

{% set version = '1.2.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'pyson4-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\pyson4\\packages\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3

pyson4-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages pyson4'
    - cwd: '{{ downloads }}\pyson4\'
    - require:
      - sls: winfor.offline.packages.python3

pyson4-wrapper-offline:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\pyson4.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - 'python3 "C:\Program Files\Python310\Scripts\pyson4.py" %*'
    - require:
      - cmd: pyson4-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
