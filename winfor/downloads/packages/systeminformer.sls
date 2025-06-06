# Name: System Informer
# Website: https://systeminformer.com/
# Description: Process analysis and dumping tool
# Category: Executables
# Author: Steven G (dmex) / Wen Jia Liu / WinSiderss
# License: MIT License (https://github.com/winsiderss/systeminformer/blob/master/LICENSE.txt)
# Version: 3.2.25011.2103
# Notes: Formerly process hacker

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.2.25011' %}
{% set subversion = '2103' %}
{% set hash = '7612d5e44a5a392ab9f0d1b5b8a79bda3cdbe19848e8ee9ec23909aaf3daad45' %}

systeminformer-download-only:
  file.managed:
    - name: '{{ downloads }}\systeminformer\systeminformer-{{ version }}-release-setup.exe'
    - source: https://github.com/winsiderss/systeminformer/releases/download/v{{ version }}.{{ subversion }}/systeminformer-{{ version }}-release-setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
