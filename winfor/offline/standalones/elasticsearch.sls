# Name: Elasticsearch
# Website: https://www.elastic.co
# Description: Distributed, RESTful, and optimized search engine for applications
# Category: Requirements
# Author: Elastic
# License: Server Side Public License / Elastic License 2.0 / Apache License 2.0 (https://github.com/elastic/elasticsearch/blob/main/LICENSE.txt)
# Version: 9.3.3
# Notes: 

{% set version = '9.3.3' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

elasticsearch-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\elasticsearch\elasticsearch-{{ version }}-windows-x86_x64.zip'
    - enforce_toplevel: False

elasticsearch-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\elasticsearch'
    - source: '{{ inpath }}\elasticsearch-{{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: elasticsearch-extract-offline
