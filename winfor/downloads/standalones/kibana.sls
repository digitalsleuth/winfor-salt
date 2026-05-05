# Name: Kibana
# Website: https://www.elastic.co
# Description: Front end for the Elastic Stack
# Category: Requirements
# Author: Elastic
# License: Elastic License 2.0 (https://github.com/elastic/kibana/blob/main/licenses/ELASTIC-LICENSE-2.0.txt)
# Version: 9.3.3
# Notes: 

{% set version = '9.3.3' %}
{% set hash = 'f09d94a1b385b19e987e02d366a94c1596915713b09023745d95113ee3eb25c5' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

kibana-download-only:
  file.managed:
    - name: '{{ downloads }}\kibana\kibana-{{ version }}-windows-x86_x64.zip'
    - source: https://artifacts.elastic.co/downloads/kibana/kibana-{{ version }}-windows-x86_64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
