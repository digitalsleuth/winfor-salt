 # Name: X-Ways Forensics Templates
# Website: https://github.com/digitalsleuth/xways-templates
# Description: Templates for X-Ways Templates
# Category: Acquisition and Analysis
# Author: Community Driven (multiple authors)
# License: 
# Version: 0.0.2
# Notes:

{% set version = '0.0.2' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('x-ways-templates') %}

xways-templates-download:
  file.managed:
    - name: 'C:\salt\tempdownload\xways-templates-non-standard-v{{ version }}.zip'
    - source: https://github.com/digitalsleuth/xways-templates/releases/download/v{{ version }}/xways-templates-non-standard-v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

xways-templates-extract:
  archive.extracted:
    - name: 'C:\xwf\'
    - source: 'C:\salt\tempdownload\xways-templates-non-standard-v{{ version }}.zip'
    - enforce_toplevel: False
    - overwrite: True
    - require:
      - file: xways-templates-download
