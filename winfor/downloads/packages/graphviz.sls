# Name: Graphviz
# Website: https://graphviz.org
# Description: Open source graph visualization software
# Category: Requirements
# Author: https://gitlab.com/graphviz/graphviz/-/blob/main/AUTHORS
# License: Eclipse Public License (https://gitlab.com/graphviz/graphviz/-/blob/main/LICENSE)
# Version: 7.0.3
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '7.0.3' %}
{% set hash = 'd6dc57c5128dd2cc54a672c63a7d61651b7bd3db7f66ee8cbc7f0e6d7d8dc1e5' %}

graphviz-download-only:
  file.managed:
    - name: '{{ downloads }}\windows_10_cmake_Release_graphviz-install-{{ version }}-win64.exe'
    - source: https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/{{ version }}/windows_10_cmake_Release_graphviz-install-{{ version }}-win64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
