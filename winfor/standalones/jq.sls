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
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

jq-download:
  file.managed:
    - name: '{{ inpath }}\jq\jq.exe'
    - source: https://github.com/jqlang/jq/releases/download/jq-{{ version }}/jq-win64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
