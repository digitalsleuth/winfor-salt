# Name: lessmsi
# Website: https://github.com/activescott/lessmsi
# Description: View and Extract the contents of a Windows MSI file
# Category: Installers
# Author: Scott Willeke (activescott)
# License: MIT License (https://github.com/activescott/lessmsi/blob/master/LICENSE)
# Version: 2.12.9
# Notes: 

{% set version = '2.12.9' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('lessmsi') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

lessmsi-download-only:
  file.managed:
    - name: '{{ downloads }}\lessmsi\lessmsi-{{ version }}.zip'
    - source: https://github.com/activescott/lessmsi/releases/download/v{{ version }}/lessmsi-v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
