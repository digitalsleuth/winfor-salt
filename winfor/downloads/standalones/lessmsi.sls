# Name: lessmsi
# Website: https://github.com/activescott/lessmsi
# Description: View and Extract the contents of a Windows MSI file
# Category: Installers
# Author: Scott Willeke (activescott)
# License: MIT License (https://github.com/activescott/lessmsi/blob/master/LICENSE)
# Version: 2.12.9
# Notes: 

{% set version = '2.12.9' %}
{% set hash = '5b4e187e74b184ad3a63ccf06c3d17dae2b8c4b6c298a996dbd51a9f6db29d21' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

lessmsi-download-only:
  file.managed:
    - name: '{{ downloads }}\lessmsi\lessmsi-{{ version }}.zip'
    - source: https://github.com/activescott/lessmsi/releases/download/v{{ version }}/lessmsi-v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
