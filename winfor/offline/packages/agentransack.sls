# Name: Agent Ransack
# Website: https://www.mythicsoft.com/agentransack/
# Description: File Search utility
# Category: Utilities
# Author: Mythicsoft
# License: End User License Agreement
# Version: 9.3.3536.1
# Notes:

{% set version = '3536' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

agentransack-extract-offline:
  archive.extracted:
    - name: '{{ downloads }}\agent-ransack\'
    - source: '{{ downloads }}\agent-ransack\agentransack_x64_msi_{{ version }}.zip'
    - enforce_toplevel: False
    
agentransack-offline:
  cmd.run:
    - name: 'msiexec /i agentransack_x64_{{ version }}.msi /qn /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\agent-ransack'
