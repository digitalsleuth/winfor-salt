# Name: Virtualbox
# Website: https://www.virtualbox.org/
# Description: Desktop virtualization software
# Category: Utilities
# Author: Oracle
# License: https://www.oracle.com/html/terms.html
# Version: 7.0.10-158379
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '7.0.10' %}
{% set build_number = '158379' %}
{% set hash = '62545b8eb17ddf27d5954ac5f8904814e12c5790d73daf545ef60bd97f4f2e12' %}

virtualbox-download-only:
  file.managed:
    - name: '{{ downloads }}\VirtualBox-{{ version }}-{{ build_number }}-Win.exe'
    - source: https://download.virtualbox.org/virtualbox/{{ version }}/VirtualBox-{{ version }}-{{ build_number }}-Win.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
