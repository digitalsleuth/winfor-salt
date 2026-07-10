# Name: Kansa
# Website: https://github.com/davehull/kansa
# Description: Powershell Incident Response Framework
# Category: Windows Analysis
# Author: Dave Hull
# License: Apache License v2.0 (https://github.com/davehull/Kansa/blob/master/LICENSE)
# Version: 18NOV2022 (No defined version)
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'c0369b102e8538f30bfc0da9d81a15f6df268a47c8ad3313d1710185aa6788ac' %}

kansa-download-only:
  file.managed:
    - name: '{{ downloads }}\kansa\kansa.zip'
    - source: https://github.com/davehull/Kansa/archive/refs/heads/master.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
