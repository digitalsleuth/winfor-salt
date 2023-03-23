# Name: Agent Ransack
# Website: https://www.mythicsoft.com/agentransack/
# Description: File Search utility
# Category: Utilities
# Author: Mythicsoft
# License: End User License Agreement
# Version: 9.0.3349.1
# Notes:

{% set version = '3349' %}
{% set hash = '8386bd1f76f47dfa64896356ba0d3cd2638b0663193f1fbfe05c1e67e7aab9f8' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

agentransack-download-only:
  file.managed:
    - name: '{{ downloads }}\agentransack_x64_msi_{{ version }}.zip'
    - source: https://download.mythicsoft.com/flp/{{ version }}/agentransack_x64_msi_{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
