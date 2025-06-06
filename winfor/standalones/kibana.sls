# Name: Kibana
# Website: https://www.elastic.co
# Description: Front end for the Elastic Stack
# Category: Requirements
# Author: Elastic
# License: Elastic License 2.0 (https://github.com/elastic/kibana/blob/main/licenses/ELASTIC-LICENSE-2.0.txt)
# Version: 9.0.1
# Notes: 

{% set version = '9.0.1' %}
{% set hash = '5362ba48677fcf11ac0880e582ac553c89549582e91e4a113818c1ef9c54fa33' %}
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
