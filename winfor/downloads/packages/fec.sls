# Name: Forensic Email Collector
# Website: https://metaspike.com
# Description: Local and Remote email acquisition tool
# Category: Email
# Author: Arman Gungor - Metaspike
# License: 
# Version: 4.5.888.111
# Notes:

{% set version = '4.5.888.111' %}
{% set hash = '60db29feb6bb6023b81dec2d45ea067af3f09c80cc951b845581482213b357d6' %}
{% set url_hash = '5159dbada900' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

fec-download-only:
  file.managed:
    - name: '{{ downloads }}\fec\fec-{{ version }}.msi'
    - source: https://www.metaspike.com/download/{{ url_hash }}_fec/
    - source_hash: sha256={{ hash }}
    - makedirs: True
