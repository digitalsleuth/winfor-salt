# Name: Agent Ransack
# Website: https://www.mythicsoft.com/agentransack/
# Description: File Search utility
# Category: Utilities
# Author: Mythicsoft
# License: End User License Agreement
# Version: 9.3.3536.1
# Notes:

{% set version = '3536' %}
{% set hash = 'c032c9b1b1aa3c219791a60eecc5ed6006ac4b76ce5bab6bd7a465952e4fb631' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

agentransack-download-only:
  file.managed:
    - name: '{{ downloads }}\agent-ransack\agentransack_x64_msi_{{ version }}.zip'
    - source: https://download.mythicsoft.com/flp/{{ version }}/agentransack_x64_msi_{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
