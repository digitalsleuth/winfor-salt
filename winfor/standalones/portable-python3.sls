# Name: Python 3 Embeddable
# Website: https://www.python.org
# Description: Python Programming Language Framework
# Category: Requirements
# Author: Python Software Foundation
# License: Python Software Foundation License Version 2.0 (https://docs.python.org/3.11/license.html)
# Version: 3.10.11
# Notes: Portable Python3 with pip via get-pip.py

{% set version = '3.10.11' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '608619f8619075629c9c69f361352a0da6ed7e62f83a0e19c63e0ea32eb7629d' %}

{% if not salt['file.file_exists'](inpath + '\\\portable-python3\\\Scripts\\\pip.exe') %}
portable-python3-download:
  file.managed:
    - name: '{{ downloads }}\python3\python-{{ version }}-embed-amd64.zip'
    - source: https://www.python.org/ftp/python/{{ version }}/python-{{ version }}-embed-amd64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

portable-python3-extract:
  archive.extracted:
    - name: '{{ inpath }}\portable-python3'
    - source: '{{ downloads }}\python3\python-{{ version }}-embed-amd64.zip'
    - enforce_toplevel: False
    - require:
      - file: portable-python3-download

portable-python3-edit-pth:
  file.replace:
    - name: '{{ inpath }}\portable-python3\python3{{ version.split(".")[1] }}._pth'
    - pattern: '#import site'
    - repl: 'import site'
    - prepend_if_not_found: False
    - count: 1
    - backup: false
    - require:
      - archive: portable-python3-extract

get-pip-download:
  file.managed:
    - name: '{{ inpath }}\portable-python3\get-pip.py'
    - source: https://bootstrap.pypa.io/get-pip.py
    - skip_verify: True
    - makedirs: True

get-pip-run:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe get-pip.py'
    - cwd: '{{ inpath }}\portable-python3'
    - require:
      - file: get-pip-download
{% else %}
"Portable python3 already downloaded":
  test.nop
{% endif %}
