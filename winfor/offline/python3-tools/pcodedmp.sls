# Name: pcodedmp
# Website: https://github.com/bontchev/pcodedmp
# Description: Python VBA p-code disassembler
# Category: Documents / Editors
# Author: Vesselin Bontchev
# License: GNU General Public License v3 (https://github.com/bontchev/pcodedmp/blob/master/LICENSE)
# Version: 1.2.6
# Notes: 

{% set version = '1.2.6' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.offline.packages.python3

pcodedmp-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages pcodedmp'
    - cwd: '{{ downloads }}\pcodedmp\'
    - require:
      - sls: winfor.offline.packages.python3
