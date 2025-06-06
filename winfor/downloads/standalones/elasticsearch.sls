# Name: Elasticsearch
# Website: https://www.elastic.co
# Description: Distributed, RESTful, and optimized search engine for applications
# Category: Requirements
# Author: Elastic
# License: Server Side Public License / Elastic License 2.0 / Apache License 2.0 (https://github.com/elastic/elasticsearch/blob/main/LICENSE.txt)
# Version: 9.0.1
# Notes:

{% set version = '9.0.1' %}
{% set hash = '080aacc0044fd38b1e6ba187d0bd53c35cf89e93d132b3dbde7d23b2500ad601' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

elasticsearch-download-only:
  file.managed:
    - name: '{{ downloads }}\elasticsearch\elasticsearch-{{ version }}-windows-x86_x64.zip'
    - source: https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-{{ version }}-windows-x86_64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
