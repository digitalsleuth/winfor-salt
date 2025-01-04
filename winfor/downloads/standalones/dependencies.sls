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
{% set hash = '7d22dc00f1c09fd4415d48ad74d1cf801893e83b9a39944b0fce6dea7ceaea99' %}

dependencies-download-only:
  file.managed:
    - name: '{{ downloads }}\dependencies\Dependencies_x64_Release-{{ version }}.zip'
    - source: https://github.com/lucasg/Dependencies/releases/download/v{{ version }}/Dependencies_x64_Release.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
