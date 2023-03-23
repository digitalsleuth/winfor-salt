# Name: Aurora Incident Response
# Website: https://github.com/cyb3rfox/Aurora-Incident-Response
# Description: Incident Response Tracking tool
# Category: Utilities
# Author: Mathias Fuchs
# License: Apache License 2.0 (https://github.com/cyb3rfox/Aurora-Incident-Response/blob/master/LICENSE)
# Version: 0.6.6
# Notes: 

{% set version = '0.6.6' %}
{% set hash = '293471F8248A0A7BD8CEBB16E7D9253E43CE810AC5755E2E707C8863CA4D6362' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

aurora-download-only:
  file.managed:
    - name: '{{ downloads }}\Aurora-win32-x64-{{ version }}.zip'
    - source: https://github.com/cyb3rfox/Aurora-Incident-Response/releases/download/{{ version }}/Aurora-win32-x64-{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
