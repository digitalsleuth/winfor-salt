# Name: Veracrypt
# Website: https://www.veracrypt.fr/code/VeraCrypt/
# Description: Encrypted container creation and management
# Category: Utilities
# Author: https://github.com/veracrypt/VeraCrypt/blob/master/doc/html/Authors.html
# License: Apache License v2 (https://github.com/veracrypt/VeraCrypt/blob/master/License.txt)
# Version: 1.26.24
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '1.26.24' %}
{% set hash = '48184a29db24a88acef0a0ab079230676cfdf1a8f2c87cbd42188952496b54da' %}

veracrypt-download-only:
  file.managed:
    - name: '{{ downloads }}\veracrypt\VeraCrypt_Setup_x64_{{ version }}.msi'
    - source: https://launchpad.net/veracrypt/trunk/{{ version }}/+download/VeraCrypt_Setup_x64_{{ version }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
