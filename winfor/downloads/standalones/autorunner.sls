# Name: Autorunner
# Website: https://github.com/woanware/autorunner
# Description: Checks for autorun applications on Windows
# Category: Windows Analysis
# Author: Mark Woan
# License: Public Domain
# Version: 0.0.16
# Notes: 

{% set version = '0.0.16' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('autorunner') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

autorunner-download-only:
  file.managed:
    - name: '{{ downloads }}\autorunner\autorunner-{{ version }}.zip'
    - source: https://github.com/woanware/autorunner/releases/download/v{{ version }}/autorunner.v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
