# Name: Pycryptodome
# Website: https://github.com/legrandin/pycryptodome
# Description: Python package of low-level cryptographic primitives
# Category: Requirements
# Author: Helder Eijs (Legrandin)
# License: Public Domain / BSD (https://github.com/Legrandin/pycryptodome/blob/master/LICENSE.rst)
# Version: 3.23.0
# Notes: 

{% set version = '3.23.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

include:
  - winfor.standalones.portable-python3

pycryptodome-folder-download-only:
  file.directory:
    - name: '{{ downloads }}\pycryptodome'
    - makedirs: True
    - force: True
    - win_inheritance: True
    - require:
      - sls: winfor.standalones.portable-python3

pycryptodome-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages pycryptodome=={{ version }}'
    - cwd: '{{ downloads }}\pycryptodome'
    - require:
      - sls: winfor.standalones.portable-python3
