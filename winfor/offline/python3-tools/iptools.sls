# Name: iptools
# Website: https://github.com/digitalsleuth/forensics_tools
# Description: IP / Hex / Dec Conversion tool 
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: GNU General Public License v3.0 (https://github.com/digitalsleuth/forensics_tools/blob/master/LICENSE)
# Version: 1.1
# Notes: 

{% set version = '1.1' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'iptools-'~ version ~'.py' %}
{% set exists = salt['file.file_exists'](downloads + '\\iptools\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3

iptools-offline:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\iptools.py'
    - source: {{ downloads }}\iptools\{{ pkg }}
    - skip_verify: True
    - makedirs: True
    - require:
      - sls: winfor.offline.packages.python3

iptools-wrapper-offline:
  file.managed:
    - name: 'C:\Program Files\Python310\Scripts\iptools.cmd'
    - win_inheritance: True
    - contents:
      - '@echo off'
      - 'python3 "C:\Program Files\Python310\Scripts\iptools.py" %*'
    - require:
      - file: iptools-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}

