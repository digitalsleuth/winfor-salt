# Name: Dokany
# Website: https://github.com/dokan-dev/dokany
# Description: User mode file system library for Windows
# Category: Utilities
# Author: Liryna
# License: GNU Lesser General Public License v3.0 / MIT (https://github.com/dokan-dev/dokany/blob/master/license.mit.txt / https://github.com/dokan-dev/dokany/blob/master/license.lgpl.txt)
# Version: 2.0.6.1000
# Notes:

{% set version = '2.0.6.1000' %}
{% set hash = '1de58167e28d0c4be6af17abfe5ce9d8dc0bff032f900b225e23b79147b0fff2' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

dokany-download-only:
  file.managed:
    - name: '{{ downloads }}\dokany\Dokan_x64.msi'
    - source: https://github.com/dokan-dev/dokany/releases/download/v{{ version }}/Dokan_x64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
