# Name: Cyotek WebCopy
# Website: https://www.cyotek.com/cyotek-webcopy
# Description: Website Copier
# Category: Network
# Author: Cyotek Ltd
# License: End User License Agreement (https://docs.cyotek.com/cyowcopy/current/licenseagreement.html)
# Version: 1.9.1.872
# Notes: Automatically launches after install. Unfortunately this cannot be avoided.

{% set version = '1.9.1.872' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('webcopy') %}

webcopy-download-only:
  file.managed:
    - name: '{{ downloads }}\webcopy\webcopy-{{ version }}.exe'
    - source: https://www.cyotek.com/downloads/get/setup-cyowcopy-{{ version }}-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
