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
{% set build_number = '174163' %}
{% set hash = 'f4750f6f64c44df03ee2921de77e63c30e84e03a3aad07fd00f292265ff164c7' %}

virtualbox-download-only:
  file.managed:
    - name: '{{ downloads }}\virtualbox\virtualbox-{{ version }}.exe'
    - source: https://download.virtualbox.org/virtualbox/{{ version }}/VirtualBox-{{ version }}-{{ build_number }}-Win.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
