# Name: jq
# Website: https://jqlang.github.io/jq 
# Description: Command-line JSON processor
# Category: Utilities
# Author: Stephen Dolan et al (https://github.com/jqlang/jq/blob/master/AUTHORS)
# License: Multi-license (https://github.com/jqlang/jq/blob/master/COPYING)
# Version: 1.8.0
# Notes: 

{% set version = '1.8.0' %}
{% set hash = 'b45fcbb27dcb9e9848ac39889a8bf86457b8d9d31e7c56387c6eab80008fd1f4' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

jq-download:
  file.managed:
    - name: '{{ inpath }}\jq\jq.exe'
    - source: https://github.com/jqlang/jq/releases/download/jq-{{ version }}/jq-win64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
