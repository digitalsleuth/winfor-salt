# Name: Veracrypt
# Website: https://www.veracrypt.fr/code/VeraCrypt/
# Description: Encrypted container creation and management
# Category: Utilities
# Author: https://github.com/veracrypt/VeraCrypt/blob/master/doc/html/Authors.html
# License: Apache License v2 (https://github.com/veracrypt/VeraCrypt/blob/master/License.txt)
# Version: 1.26.7
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.26.7' %}
{% set hash = 'c802dcdda02e9a7a3f52645bf90285d3055c76038dc760131192cc23327ca8f8' %}

veracrypt-download-only:
  file.managed:
    - name: '{{ downloads }}\veracrypt\VeraCrypt_Setup_x64_{{ version }}.msi'
    - source: https://launchpad.net/veracrypt/trunk/{{ version }}/+download/VeraCrypt_Setup_x64_{{ version }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
