# Name: Virtualbox
# Website: https://www.virtualbox.org/
# Description: Desktop virtualization software
# Category: Utilities
# Author: Oracle
# License: https://www.oracle.com/html/terms.html
# Version: 7.2.10-174163
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '7.2.10' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set build_number = get_hash('virtualbox', 'build_number') %}
{% set hash = get_hash('virtualbox') %}

virtualbox-download-only:
  file.managed:
    - name: '{{ downloads }}\virtualbox\virtualbox-{{ version }}.exe'
    - source: https://download.virtualbox.org/virtualbox/{{ version }}/VirtualBox-{{ version }}-{{ build_number }}-Win.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
