# Name: Kibana
# Website: https://www.elastic.co
# Description: Front end for the Elastic Stack
# Category: Requirements
# Author: Elastic
# License: Elastic License 2.0 (https://github.com/elastic/kibana/blob/main/licenses/ELASTIC-LICENSE-2.0.txt)
# Version: 9.3.3
# Notes: 

{% set version = '9.3.3' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

kibana-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\kibana\kibana-{{ version }}-windows-x86_x64.zip'
    - enforce_toplevel: False

kibana-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\kibana'
    - source: '{{ inpath }}\kibana-{{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: kibana-extract-offline
