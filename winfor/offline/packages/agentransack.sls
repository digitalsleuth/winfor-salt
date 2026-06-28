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
{% set pkg = 'agent-ransack-'~ version ~'.zip' %}
{% set installer = 'agentransack_x64_'~ version ~'.msi' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set exists = salt['file.file_exists'](downloads + '\\agent-ransack\\' + pkg) %}

{% if exists %}
agentransack-extract-offline:
  archive.extracted:
    - name: '{{ downloads }}\agent-ransack\'
    - source: '{{ downloads }}\agent-ransack\{{ pkg }}'
    - enforce_toplevel: False
    
agentransack-offline:
  cmd.run:
    - name: 'msiexec /i {{ installer }} /qn /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\agent-ransack'
{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
