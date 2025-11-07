# Name: jq
# Website: https://jqlang.github.io/jq 
# Description: Command-line JSON processor
# Category: Utilities
# Author: Stephen Dolan et al (https://github.com/jqlang/jq/blob/master/AUTHORS)
# License: Multi-license (https://github.com/jqlang/jq/blob/master/COPYING)
# Version: 1.8.1
# Notes: 

{% set version = '1.8.1' %}
{% set hash = '23cb60a1354eed6bcc8d9b9735e8c7b388cd1fdcb75726b93bc299ef22dd9334' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

jq-download-only:
  file.managed:
    - name: '{{ downloads }}\jq\jq-win64-{{ version }}.exe'
    - source: https://github.com/jqlang/jq/releases/download/jq-{{ version }}/jq-win64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
