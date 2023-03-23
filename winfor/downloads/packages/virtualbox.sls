# Name: Virtualbox
# Website: https://www.virtualbox.org/
# Description: Desktop virtualization software
# Category: Utilities
# Author: Oracle
# License: https://www.oracle.com/html/terms.html
# Version: 7.0.4-154605
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '7.0.4' %}
{% set build_number = '154605' %}
{% set hash = 'b7265dd6c0f7f635fec9be67b4b5e34b4105b93d7c11aeef0b5ed6fe1d2dc556' %}

virtualbox-download-only:
  file.managed:
    - name: '{{ downloads }}\VirtualBox-{{ version }}-{{ build_number }}-Win.exe'
    - source: https://download.virtualbox.org/virtualbox/{{ version }}/VirtualBox-{{ version }}-{{ build_number }}-Win.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
