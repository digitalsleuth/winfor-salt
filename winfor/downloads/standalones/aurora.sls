# Name: Aurora Incident Response
# Website: https://github.com/cyb3rfox/Aurora-Incident-Response
# Description: Incident Response Tracking tool
# Category: Utilities
# Author: Mathias Fuchs
# License: Apache License 2.0 (https://github.com/cyb3rfox/Aurora-Incident-Response/blob/master/LICENSE)
# Version: 0.6.6
# Notes: 

{% set version = '0.6.6' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('aurora') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

aurora-download-only:
  file.managed:
    - name: '{{ downloads }}\aurora\aurora-{{ version }}.zip'
    - source: https://github.com/cyb3rfox/Aurora-Incident-Response/releases/download/{{ version }}/Aurora-win32-x64-{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
