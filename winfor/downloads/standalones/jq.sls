# Name: jq
# Website: https://jqlang.github.io/jq 
# Description: Command-line JSON processor
# Category: Utilities
# Author: Stephen Dolan et al (https://github.com/jqlang/jq/blob/master/AUTHORS)
# License: Multi-license (https://github.com/jqlang/jq/blob/master/COPYING)
# Version: 1.8.2
# Notes: 

{% set version = '1.8.2' %}
{% set hash = 'a6fc67fedaf9128a3309a1e2ebb8b986aeccf70122ee46d2cb4849e423f0c627' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

jq-download-only:
  file.managed:
    - name: '{{ downloads }}\jq\jq-{{ version }}.exe'
    - source: https://github.com/jqlang/jq/releases/download/jq-{{ version }}/jq-win64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
