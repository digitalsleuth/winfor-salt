# Name: Node.js
# Website: https://nodejs.org
# Description: Open-Source JavaScript Runtime Environment
# Category: Requirements
# Author: https://github.com/nodejs/node/blob/main/README.md#current-project-team-members
# License: Various (https://github.com/nodejs/node/blob/main/LICENSE)
# Version: 22.16.0
# Notes:

{% set version = '22.16.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('nodejs') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

node.js-download-only:
  file.managed:
    - name: '{{ downloads }}\nodejs\nodejs-{{ version }}.msi'
    - source: https://nodejs.org/dist/v{{ version }}/node-v{{ version }}-x64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
