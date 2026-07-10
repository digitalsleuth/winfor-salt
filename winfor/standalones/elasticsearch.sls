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
