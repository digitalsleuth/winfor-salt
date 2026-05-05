# Name: Elasticsearch
# Website: https://www.elastic.co
# Description: Distributed, RESTful, and optimized search engine for applications
# Category: Requirements
# Author: Elastic
# License: Server Side Public License / Elastic License 2.0 / Apache License 2.0 (https://github.com/elastic/elasticsearch/blob/main/LICENSE.txt)
# Version: 9.3.3
# Notes:

{% set version = '9.3.3' %}
{% set hash = '4e080936fb9fbb99e8fa146cda54decfe59088f61de8d1ad0b42c996b2d0bccb' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

elasticsearch-download-only:
  file.managed:
    - name: '{{ downloads }}\elasticsearch\elasticsearch-{{ version }}-windows-x86_x64.zip'
    - source: https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-{{ version }}-windows-x86_64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
