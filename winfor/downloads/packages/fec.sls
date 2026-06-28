# Name: Forensic Email Collector
# Website: https://metaspike.com
# Description: Local and Remote email acquisition tool
# Category: Email
# Author: Arman Gungor - Metaspike
# License: 
# Version: 4.5.848.87
# Notes:

{% set version = '4.5.848.87' %}
{% set hash = 'be23e69d8af976cb7ba0eeb6c81b46af0647d0810f47423b526fd9c8fce8b7b8' %}
{% set url_hash = 'abaf1c75ffb4' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

fec-download-only:
  file.managed:
    - name: '{{ downloads }}\fec\fec-{{ version }}.msi'
    - source: https://www.metaspike.com/download/{{ url_hash }}_fec/
    - source_hash: sha256={{ hash }}
    - makedirs: True
