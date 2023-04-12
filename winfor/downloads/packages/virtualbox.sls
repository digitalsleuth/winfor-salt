# Name: Virtualbox
# Website: https://www.virtualbox.org/
# Description: Desktop virtualization software
# Category: Utilities
# Author: Oracle
# License: https://www.oracle.com/html/terms.html
# Version: 7.0.6-155176
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '7.0.6' %}
{% set build_number = '155176' %}
{% set hash = 'a4142ecf52657bd6e06b66573919ac342ef460a61f4ee7d35c235c54640c3a39' %}

virtualbox-download-only:
  file.managed:
    - name: '{{ downloads }}\VirtualBox-{{ version }}-{{ build_number }}-Win.exe'
    - source: https://download.virtualbox.org/virtualbox/{{ version }}/VirtualBox-{{ version }}-{{ build_number }}-Win.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
