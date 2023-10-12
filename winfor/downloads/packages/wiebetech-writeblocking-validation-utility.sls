# Name: Wiebetech Write Blocking Validation Utility
# Website: https://wiebetech.com
# Description: Write blocker capability testing
# Category: Write Blockers
# Author: Wiebetech
# License: Free To Use
# Version: 2.1.0.7
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.1.0.7' %}
{% set date = '2022.07.19' %}
{% set hash = '64b019581c9f7c934fc86bd507224c411028e3fe1a0349b3536b04f0785d06e1' %}

wiebetech-writeblocking-validation-utility-download-only:
  file.managed:
    - name: '{{ downloads }}\wiebetech\WbValUtil-{{ version }}-({{ date }})-x64.exe'
    - source: https://wiebetech.com/downloads/1337/WbValUtil-{{ version }}-({{ date }})-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
