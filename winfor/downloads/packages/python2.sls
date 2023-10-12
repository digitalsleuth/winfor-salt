# Name: Python 2
# Website: https://www.python.org
# Description: Python Programming Language Framework
# Category: Requirements
# Author: Python Software Foundation
# License: Python Software Foundation License Version 2.0 (https://docs.python.org/2.7/license.html)
# Version: 2.7.18
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.7.18' %}
{% set hash = 'b74a3afa1e0bf2a6fc566a7b70d15c9bfabba3756fb077797d16fffa27800c05' %}

python2_x64-download-only:
  file.managed:
    - name: '{{ downloads }}\python2\python-{{ version }}.amd64.msi'
    - source: https://www.python.org/ftp/python/{{ version }}/python-{{ version }}.amd64.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
