# Name: Python 3 Embeddable
# Website: https://www.python.org
# Description: Python Programming Language Framework
# Category: Requirements
# Author: Python Software Foundation
# License: Python Software Foundation License Version 2.0 (https://docs.python.org/3.11/license.html)
# Version: 3.11.9
# Notes: Portable Python3 with pip via get-pip.py

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = "3.11.9" %}
{% set hash = '009d6bf7e3b2ddca3d784fa09f90fe54336d5b60f0e0f305c37f400bf83cfd3b' %}

portable-python3-download-only:
  file.managed:
    - name: '{{ downloads }}\python3\python-{{ version }}-embed-amd64.zip'
    - source: https://www.python.org/ftp/python/{{ version }}/python-{{ version }}-embed-amd64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

portable-python3-extract-download-only:
  archive.extracted:
    - name: '{{ downloads }}\portable-python3'
    - source: '{{ downloads }}\python3\python-{{ version }}-embed-amd64.zip'
    - enforce_toplevel: False
    - require:
      - file: portable-python3-download-only

get-pip-download-only:
  file.managed:
    - name: '{{ downloads }}\portable-python3\get-pip.py'
    - source: https://bootstrap.pypa.io/get-pip.py
    - skip_verify: True
    - makedirs: True
    - require:
      - archive: portable-python3-extract-download-only

get-pip-run-download-only:
  cmd.run:
    - name: '{{ downloads }}\portable-python3\python.exe get-pip.py'
    - cwd: '{{ downloads }}\portable-python3'
    - require:
      - file: get-pip-download-only

