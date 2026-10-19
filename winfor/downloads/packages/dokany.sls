# Name: Dokany
# Website: https://github.com/dokan-dev/dokany
# Description: User mode file system library for Windows
# Category: Utilities
# Author: Liryna
# License: GNU Lesser General Public License v3.0 / MIT (https://github.com/dokan-dev/dokany/blob/master/license.mit.txt / https://github.com/dokan-dev/dokany/blob/master/license.lgpl.txt)
# Version: 2.3.1.1000
# Notes:

{% set version = '2.3.1.1000' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('dokany') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

dokany-download-only:
  file.managed:
    - name: '{{ downloads }}\dokany\dokany-{{ version }}.msi'
    - source: https://github.com/dokan-dev/dokany/releases/download/v{{ version }}/Dokan_x64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
