# Name: Kibana
# Website: https://www.elastic.co
# Description: Front end for the Elastic Stack
# Category: Requirements
# Author: Elastic
# License: Elastic License 2.0 (https://github.com/elastic/kibana/blob/main/licenses/ELASTIC-LICENSE-2.0.txt)
# Version: 9.4.3
# Notes: 

{% set version = '9.4.3' %}
{% set hash = 'e307db329d156f2c0193f4012879ba6ff92a8adf3c99d5f1ac5d9c6275fc85e2' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

kibana-download-only:
  file.managed:
    - name: '{{ downloads }}\kibana\kibana-{{ version }}.zip'
    - source: https://artifacts.elastic.co/downloads/kibana/kibana-{{ version }}-windows-x86_64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
