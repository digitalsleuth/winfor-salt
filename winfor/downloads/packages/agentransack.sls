# Name: Agent Ransack
# Website: https://www.mythicsoft.com/agentransack/
# Description: File Search utility
# Category: Utilities
# Author: Mythicsoft
# License: End User License Agreement
# Version: 9.2.3434.1
# Notes:

{% set version = '3434' %}
{% set hash = '21ba767bc9c1b20360abca4e846f42a21056af082b49788abd28f1ecb3dfc5ea' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

agentransack-download-only:
  file.managed:
    - name: '{{ downloads }}\agent-ransack\agentransack_x64_msi_{{ version }}.zip'
    - source: https://download.mythicsoft.com/flp/{{ version }}/agentransack_x64_msi_{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
