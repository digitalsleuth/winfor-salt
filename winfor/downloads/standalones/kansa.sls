# Name: Kansa
# Website: https://github.com/davehull/kansa
# Description: Powershell Incident Response Framework
# Category: Windows Analysis
# Author: Dave Hull
# License: Apache License v2.0 (https://github.com/davehull/Kansa/blob/master/LICENSE)
# Version: 18NOV2022 (No defined version)
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

kansa-download-only:
  git.latest:
    - name: https://github.com/davehull/kansa.git
    - target: '{{ downloads }}\kansa'
    - rev: master
    - force_clone: True
    - force_reset: True
