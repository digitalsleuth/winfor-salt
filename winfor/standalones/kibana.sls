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
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

kibana-download:
  file.managed:
    - name: 'C:\salt\tempdownload\kibana-{{ version }}-windows-x86_x64.zip'
    - source: https://artifacts.elastic.co/downloads/kibana/kibana-{{ version }}-windows-x86_64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

kibana-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\kibana-{{ version }}-windows-x86_x64.zip'
    - enforce_toplevel: False
    - require:
      - file: kibana-download

kibana-folder-rename:
  file.rename:
    - name: '{{ inpath }}\kibana'
    - source: '{{ inpath }}\kibana-{{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: kibana-extract
