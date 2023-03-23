# Name: lessmsi
# Website: https://github.com/activescott/lessmsi
# Description: View and Extract the contents of a Windows MSI file
# Category: Installers
# Author: Scott Willeke (activescott)
# License: MIT License (https://github.com/activescott/lessmsi/blob/master/LICENSE)
# Version: 1.10.0
# Notes: 

{% set versions = [('1.10.0', 'fdf6a3aab9c893966057004b64e2931af431a3459d323666e2e75c33a6825816')] %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

lessmsi-download-only:
  file.managed:
  {% for version, hash in versions %}
    - name: '{{ downloads }}\lessmsi-v{{ version }}.zip'
    - source: https://github.com/activescott/lessmsi/releases/download/v{{ version }}/lessmsi-v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
  {% endfor %}
