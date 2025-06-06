# Name: Node.js
# Website: https://nodejs.org
# Description: Open-Source JavaScript Runtime Environment
# Category: Requirements
# Author: https://github.com/nodejs/node/blob/main/README.md#current-project-team-members
# License: Various (https://github.com/nodejs/node/blob/main/LICENSE)
# Version: 22.16.0
# Notes:

{% set version = '22.16.0' %}
{% set hash = 'e2f2802202513e1bf41f7c00307635f6c6fe31c0275c1e03d269d45a76e5fc2e' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

node.js-download-only:
  file.managed:
    - name: '{{ downloads }}\nodejs\node-v{{ version }}-x64.msi'
    - source: https://nodejs.org/dist/v{{ version }}/node-v{{ version }}-x64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
