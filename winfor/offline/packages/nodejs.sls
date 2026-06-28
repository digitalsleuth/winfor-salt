# Name: Node.js
# Website: https://nodejs.org
# Description: Open-Source JavaScript Runtime Environment
# Category: Requirements
# Author: https://github.com/nodejs/node/blob/main/README.md#current-project-team-members
# License: Various (https://github.com/nodejs/node/blob/main/LICENSE)
# Version: 22.16.0
# Notes: 

{% set version = '22.16.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'nodejs-'~ version ~'.msi' %}
{% set exists = salt['file.file_exists'](downloads + '\\nodejs\\' + pkg) %}

{% if exists %}
nodejs-install-offline:
  cmd.run:
    - name: 'msiexec /i {{ pkg }} /qn /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\nodejs\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
