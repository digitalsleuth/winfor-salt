# Name: Elasticsearch
# Website: https://www.elastic.co
# Description: Distributed, RESTful, and optimized search engine for applications
# Category: Requirements
# Author: Elastic
# License: Server Side Public License / Elastic License 2.0 / Apache License 2.0 (https://github.com/elastic/elasticsearch/blob/main/LICENSE.txt)
# Version: 8.11.1
# Notes: 

{% set version = '8.11.1' %}
{% set hash = 'fa2c78045074b55c1b5442f1df18d544c6002aa67881a44d3017e06a90f53966' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

elasticsearch-download:
  file.managed:
    - name: 'C:\salt\tempdownload\elasticsearch-{{ version }}-windows-x86_x64.zip'
    - source: https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-{{ version }}-windows-x86_64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

elasticsearch-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\elasticsearch-{{ version }}-windows-x86_x64.zip'
    - enforce_toplevel: False
    - require:
      - file: elasticsearch-download

elasticsearch-folder-rename:
  file.rename:
    - name: '{{ inpath }}\elasticsearch'
    - source: '{{ inpath }}\elasticsearch-{{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: elasticsearch-extract
