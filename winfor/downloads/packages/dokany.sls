# Name: Dokany
# Website: https://github.com/dokan-dev/dokany
# Description: User mode file system library for Windows
# Category: Utilities
# Author: Liryna
# License: GNU Lesser General Public License v3.0 / MIT (https://github.com/dokan-dev/dokany/blob/master/license.mit.txt / https://github.com/dokan-dev/dokany/blob/master/license.lgpl.txt)
# Version: 2.3.0.1000
# Notes:

{% set version = '2.3.0.1000' %}
{% set hash = '1aec3fda5497ea3e4847c8e033a2834c720fa69b5e1c060b6a4d32d0199e8e29' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

dokany-download-only:
  file.managed:
    - name: '{{ downloads }}\dokany\Dokan_x64-{{ version }}.msi'
    - source: https://github.com/dokan-dev/dokany/releases/download/v{{ version }}/Dokan_x64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
