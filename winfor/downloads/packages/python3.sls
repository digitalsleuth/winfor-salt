# Name: Python 3
# Website: https://www.python.org
# Description: Python Programming Language Framework
# Category: Requirements
# Author: Python Software Foundation
# License: Python Software Foundation License Version 2.0 (https://docs.python.org/3.10/license.html)
# Version: 3.10.11
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.10.11' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('python3') %}

python3_x64-download-only:
  file.managed:
    - name: '{{ downloads }}\python3\python3-{{ version }}.exe'
    - source: https://www.python.org/ftp/python/{{ version }}/python-{{ version }}-amd64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
