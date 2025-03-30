# Name: PEStudio
# Website: https://www.winitor.com
# Description: PE Analysis Tool
# Category: Executables
# Author: Marc Ochsenmeier
# License: As-Is, without warranty (https://www.winitor.com/tools/pestudio/changes.log)
# Version: 9.61
# Notes: 

{% set hash = 'c1e2d0c1fbf5951486cf3d850cc24b11b66e25e0a5b77a623e2eb13ffad9ddd9' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '9.61' %}

pestudio-download-only:
  file.managed:
    - name: '{{ downloads }}\pestudio\pestudio-{{ version }}.zip'
    - source: https://www.winitor.com/tools/pestudio/current/pestudio.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
