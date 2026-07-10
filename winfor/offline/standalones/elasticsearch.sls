# Name: Elasticsearch
# Website: https://www.elastic.co
# Description: Distributed, RESTful, and optimized search engine for applications
# Category: Requirements
# Author: Elastic
# License: Server Side Public License / Elastic License 2.0 / Apache License 2.0 (https://github.com/elastic/elasticsearch/blob/main/LICENSE.txt)
# Version: 9.4.3
# Notes: 

{% set version = '9.4.3' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'elasticsearch-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\elasticsearch\\' + pkg) %}

{% if exists %}

elasticsearch-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\elasticsearch\{{ pkg }}'
    - enforce_toplevel: False

elasticsearch-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\elasticsearch'
    - source: '{{ inpath }}\elasticsearch-{{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: elasticsearch-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
