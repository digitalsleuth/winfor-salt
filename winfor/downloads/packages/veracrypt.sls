# Name: Veracrypt
# Website: https://www.veracrypt.fr/code/VeraCrypt/
# Description: Encrypted container creation and management
# Category: Utilities
# Author: https://github.com/veracrypt/VeraCrypt/blob/master/doc/html/Authors.html
# License: Apache License v2 (https://github.com/veracrypt/VeraCrypt/blob/master/License.txt)
# Version: 1.25.9
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.25.9' %}
{% set hash = '206d31c2ed1a2b0390d4dfa12e74a9b9dae88658d1f9bfa1bb433b23e2b24fd8' %}

veracrypt-download-only:
  file.managed:
    - name: '{{ downloads }}\VeraCrypt_Setup_x64_{{ version }}.msi'
    - source: https://launchpad.net/veracrypt/trunk/{{ version }}/+download/VeraCrypt_Setup_x64_{{ version }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
