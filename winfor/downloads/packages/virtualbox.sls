# Name: Virtualbox
# Website: https://www.virtualbox.org/
# Description: Desktop virtualization software
# Category: Utilities
# Author: Oracle
# License: https://www.oracle.com/html/terms.html
# Version: 7.1.10-169112
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '7.1.10' %}
{% set build_number = '169112' %}
{% set hash = '193de3f5890b4653e2b05f95221c681f96749e7f10f7f38d1ddbd3895b3eca70' %}

virtualbox-download-only:
  file.managed:
    - name: '{{ downloads }}\virtualbox\VirtualBox-{{ version }}-{{ build_number }}-Win.exe'
    - source: https://download.virtualbox.org/virtualbox/{{ version }}/VirtualBox-{{ version }}-{{ build_number }}-Win.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
