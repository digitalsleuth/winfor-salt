# Name: Graphviz
# Website: https://graphviz.org
# Description: Open source graph visualization software
# Category: Requirements
# Author: https://gitlab.com/graphviz/graphviz/-/blob/main/AUTHORS
# License: Eclipse Public License (https://gitlab.com/graphviz/graphviz/-/blob/main/LICENSE)
# Version: 12.2.1
# Notes:

{% set version = '12.2.1' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'graphviz-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\graphviz\\' + pkg) %}

{% if exists %}
graphviz-install-offline:
  cmd.run:
    - name: '{{ pkg }} /S'
    - shell: cmd
    - cwd: '{{ downloads }}\graphviz\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
