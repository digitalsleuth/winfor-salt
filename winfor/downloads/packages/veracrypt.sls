# Name: Veracrypt
# Website: https://www.veracrypt.fr/code/VeraCrypt/
# Description: Encrypted container creation and management
# Category: Utilities
# Author: https://github.com/veracrypt/VeraCrypt/blob/master/doc/html/Authors.html
# License: Apache License v2 (https://github.com/veracrypt/VeraCrypt/blob/master/License.txt)
# Version: 1.26.29
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.26.29' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('veracrypt') %}

veracrypt-download-only:
  file.managed:
    - name: '{{ downloads }}\veracrypt\veracrypt-{{ version }}.msi'
    - source: https://github.com/veracrypt/VeraCrypt/releases/download/VeraCrypt_{{ version }}/VeraCrypt_Setup_x64_{{ version }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
