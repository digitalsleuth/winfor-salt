# Name: Python 3
# Website: https://www.python.org
# Description: Python Programming Language Framework
# Category: Requirements
# Author: Python Software Foundation
# License: Python Software Foundation License Version 2.0 (https://docs.python.org/3.10/license.html)
# Version: 3.10.1150.0
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.10.1' %}
{% set hash = '8b89b75032ddfbdac80225dc288f5ec276f5cda00d4000226abda1158f90f7a4' %}

python3_x64-download-only:
  file.managed:
    - name: '{{ downloads }}\python3\python-{{ version }}-amd64.exe'
    - source: https://www.python.org/ftp/python/{{ version }}/python-{{ version }}-amd64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
