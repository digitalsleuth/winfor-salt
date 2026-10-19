# Name: Kansa
# Website: https://github.com/davehull/kansa
# Description: Powershell Incident Response Framework
# Category: Windows Analysis
# Author: Dave Hull
# License: Apache License v2.0 (https://github.com/davehull/Kansa/blob/master/LICENSE)
# Version: 18NOV2022 (No defined version)
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('kansa') %}

kansa-download-only:
  file.managed:
    - name: '{{ downloads }}\kansa\kansa.zip'
    - source: https://github.com/davehull/Kansa/archive/refs/heads/master.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
