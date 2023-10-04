# Name: Agent Ransack
# Website: https://www.mythicsoft.com/agentransack/
# Description: File Search utility
# Category: Utilities
# Author: Mythicsoft
# License: End User License Agreement
# Version: 9.2.3406.1
# Notes:

{% set version = '3406' %}
{% set hash = '8e09b21b07e05bea63b750b5b35149a9b67727e6b1a5f2768aa29ef380a6b300' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

agentransack-download-only:
  file.managed:
    - name: '{{ downloads }}\agentransack_x64_msi_{{ version }}.zip'
    - source: https://download.mythicsoft.com/flp/{{ version }}/agentransack_x64_msi_{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
