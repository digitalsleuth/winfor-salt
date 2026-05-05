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
