# Name: Registry Viewer
# Website: https://exterro.com
# Description: Windows Registry hive viewer
# Category: Registry
# Author: AccessData / Exterro
# License: EULA
# Version: 2.0.0.7
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.0.0' %}
{% set hash = 'df911e882ebc4c00eff08dcc944e617d827e7237593e2620e1fc0792169777b4' %}

registry-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\registry-viewer\AccessData_Registry_Viewer_{{ version }}.exe'
    - source: https://d1kpmuwb7gvu1i.cloudfront.net/AccessData_Registry_Viewer_{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
