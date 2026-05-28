# Name: Process Hacker
# Website: https://processhacker.sourceforge.io
# Description: Process analysis and dumping tool
# Category: Executables
# Author: Steven G (dmex) / Wen Jia Liu / WinSiderss
# License: GNU General Public License v3 - https://processhacker.sourceforge.io/gpl.php
# Version: 2.39.0.124
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.39' %}
{% set hash = '28042dd4a92a0033b8f1d419b9e989c5b8e32d1d2d881f5c8251d58ce35b9063' %}

process-hacker-download-only:
  file.managed:
    - name: '{{ downloads }}\process-hacker\processhacker-{{ version }}-setup.exe'
    - source: https://github.com/winsiderss/systeminformer/releases/download/v2.39/processhacker-2.39-setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
