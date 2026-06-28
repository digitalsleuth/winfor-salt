# Name: Pycryptodome
# Website: https://github.com/legrandin/pycryptodome
# Description: Python package of low-level cryptographic primitives
# Category: Requirements
# Author: Helder Eijs (Legrandin)
# License: Public Domain / BSD (https://github.com/Legrandin/pycryptodome/blob/master/LICENSE.rst)
# Version: 3.23.0
# Notes: 

{% set version = '3.23.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.offline.packages.python3

pycryptodome-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages pycryptodome'
    - cwd: '{{ downloads }}\pycryptodome\'
    - require:
      - sls: winfor.offline.packages.python3
