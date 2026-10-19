# Name: Dependencies
# Website: https://github.com/lucasg/dependencies
# Description: Rewrite of original "depends.exe"
# Category: Executables
# Author: lucasg
# License: MIT License (https://github.com/lucasg/Dependencies/blob/master/LICENSE)
# Version: 1.11.1
# Notes:

{% set version = '1.11.1' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('dependencies') %}

dependencies-download-only:
  file.managed:
    - name: '{{ downloads }}\dependencies\dependencies-{{ version }}.zip'
    - source: https://github.com/lucasg/Dependencies/releases/download/v{{ version }}/Dependencies_x64_Release.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
