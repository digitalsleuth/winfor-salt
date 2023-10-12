# Name: WMI Parser
# Website: https://github.com/woanware/wmi-parser
# Description: Parse the WMI object database for persistence
# Category: Windows Analysis
# Author: Mark Woan
# License: Unknown
# Version: 0.0.2
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.0.2' %}
{% set hash = '55048cccae7adb1471cb0d32a317df306355a37bb5373406a4bf1eeee852671d' %}
wmi-parser-download-only:
  file.managed:
    - name: '{{ downloads }}\wmi-parser\wmi-parser.v{{ version }}.zip'
    - source: https://github.com/woanware/wmi-parser/releases/download/v{{ version }}/wmi-parser.v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
