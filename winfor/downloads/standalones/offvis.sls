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
{% set hash = '8432c2e81ab51bf46fc9a1b17629f4ff7c3902f976132477428b84918be08351' %}

offvis-download-only:
  file.managed:
    - name: '{{ downloads }}\offvis\offvis-{{ version }}.zip'
    - source: https://go.microsoft.com/fwlink/?LinkId=158791
    - source_hash: sha256={{ hash }}
    - makedirs: True
