# Name: Wiebetech Write Blocking Validation Utility
# Website: https://wiebetech.com
# Description: Write blocker capability testing
# Category: Utilities
# Author: Wiebetech
# License: Free To Use
# Version: 2.1.1.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.1.1.0' %}
{% set date = '2024.05.14' %}
{% set subfolder = '1395' %}
{% set hash = 'cdc5253e2fe25f9b8335941ad21c07cfa676cf20cd50911bbda6a01771aa03ff' %}

wiebetech-writeblocking-validation-utility-download-only:
  file.managed:
    - name: '{{ downloads }}\wiebetech\WbValUtil-{{ version }}-({{ date }})-x64.exe'
    - source: https://wiebetech.com/downloads/{{ subfolder }}/WbValUtil-{{ version }}-({{ date }})-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
