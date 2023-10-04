# Name: Graphviz
# Website: https://graphviz.org
# Description: Open source graph visualization software
# Category: Requirements
# Author: https://gitlab.com/graphviz/graphviz/-/blob/main/AUTHORS
# License: Eclipse Public License (https://gitlab.com/graphviz/graphviz/-/blob/main/LICENSE)
# Version: 9.0.0
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '9.0.0' %}
{% set hash = '01670c7e5bf637656bd89cd8484d517f3b5bc77f8666ceb29ddcc17e095b0f61' %}

graphviz-download-only:
  file.managed:
    - name: '{{ downloads }}\windows_10_cmake_Release_graphviz-install-{{ version }}-win64.exe'
    - source: https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/{{ version }}/windows_10_cmake_Release_graphviz-install-{{ version }}-win64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
