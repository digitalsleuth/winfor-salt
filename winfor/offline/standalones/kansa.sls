# Name: Kansa
# Website: https://github.com/davehull/kansa
# Description: Powershell Incident Response Framework
# Category: Windows Analysis
# Author: Dave Hull
# License: Apache License v2.0 (https://github.com/davehull/Kansa/blob/master/LICENSE)
# Version: 18NOV2022 (No defined version)
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

kansa-offline:
  file.copy:
    - name: '{{ inpath }}\kansa'
    - source: '{{ downloads }}\kansa'
    - force: True
    - recurse: True
    - makedirs: True
    - win_inheritance: True
