# Name: Graphviz
# Website: https://graphviz.org
# Description: Open source graph visualization software
# Category: Requirements
# Author: https://gitlab.com/graphviz/graphviz/-/blob/main/AUTHORS
# License: Eclipse Public License (https://gitlab.com/graphviz/graphviz/-/blob/main/LICENSE)
# Version: 12.2.1
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '12.2.1' %}
{% set hash = '6809d0095919844a6c557092d2005605450d8ad2ef69ed89d7bc3ee791b6f9da' %}

graphviz-download-only:
  file.managed:
    - name: '{{ downloads }}\graphviz\windows_10_cmake_Release_graphviz-install-{{ version }}-win64.exe'
    - source: https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/{{ version }}/windows_10_cmake_Release_graphviz-install-{{ version }}-win64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
