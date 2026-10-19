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
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set subversion = get_hash('systeminformer', 'subversion') %}
{% set hash = get_hash('systeminformer') %}

systeminformer-download-only:
  file.managed:
    - name: '{{ downloads }}\systeminformer\systeminformer-{{ version }}.{{ subversion }}.exe'
    - source: https://github.com/winsiderss/systeminformer/releases/download/v{{ version }}.{{ subversion }}/systeminformer-{{ version }}-release-setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
