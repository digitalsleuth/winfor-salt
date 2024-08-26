# Name: Node.js
# Website: https://nodejs.org
# Description: Open-Source JavaScript Runtime Environment
# Category: Requirements
# Author: https://github.com/nodejs/node/blob/main/README.md#current-project-team-members
# License: Various (https://github.com/nodejs/node/blob/main/LICENSE)
# Version: 18.16.0
# Notes:

{% set version = '18.16.0' %}
{% set hash = '5bfb6f3ab89e198539408f7e0e8ec0b0bd5efe8898573ec05b381228efb45a5d' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

node.js-download-only:
  file.managed:
    - name: '{{ downloads }}\nodejs\node-v{{ version }}-x64.msi'
    - source: https://nodejs.org/dist/v{{ version }}/node-v{{ version }}-x64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
