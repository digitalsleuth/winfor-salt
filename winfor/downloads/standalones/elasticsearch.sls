# Name: Elasticsearch
# Website: https://www.elastic.co
# Description: Distributed, RESTful, and optimized search engine for applications
# Category: Requirements
# Author: Elastic
# License: Server Side Public License / Elastic License 2.0 / Apache License 2.0 (https://github.com/elastic/elasticsearch/blob/main/LICENSE.txt)
# Version: 9.4.3
# Notes:

{% set version = '9.4.3' %}
{% set hash = '335ab2f51b2dfe3be1d5fd25a40877b012fd87cff05a147cdba1b46f7ab38590' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

elasticsearch-download-only:
  file.managed:
    - name: '{{ downloads }}\elasticsearch\elasticsearch-{{ version }}.zip'
    - source: https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-{{ version }}-windows-x86_64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
