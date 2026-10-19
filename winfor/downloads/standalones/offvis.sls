# Name: OffVis
# Website: http://go.microsoft.com/fwlink/?LinkId=158791
# Description: Office document visualization tool
# Category: Documents / Editors
# Author: Microsoft
# License: EULA
# Version: 1.1.0.0
# Notes: 

{% set version = '1.1.0.0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('offvis') %}

offvis-download-only:
  file.managed:
    - name: '{{ downloads }}\offvis\offvis-{{ version }}.zip'
    - source: https://go.microsoft.com/fwlink/?LinkId=158791
    - source_hash: sha256={{ hash }}
    - makedirs: True
