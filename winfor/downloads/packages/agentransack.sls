# Name: Agent Ransack
# Website: https://www.mythicsoft.com/agentransack/
# Description: File Search utility
# Category: Utilities
# Author: Mythicsoft
# License: End User License Agreement
# Version: 9.3.3517.1
# Notes:

{% set version = '3517' %}
{% set hash = '98577db3b1087c42c46768748a1e815d2a51a225f8dcb1876e86b305d1ffaa9b' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

agentransack-download-only:
  file.managed:
    - name: '{{ downloads }}\agent-ransack\agentransack_x64_msi_{{ version }}.zip'
    - source: https://download.mythicsoft.com/flp/{{ version }}/agentransack_x64_msi_{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
