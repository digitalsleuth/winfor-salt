# Name: pcodedmp
# Website: https://github.com/bontchev/pcodedmp
# Description: Python VBA p-code disassembler
# Category: Documents / Editors
# Author: Vesselin Bontchev
# License: GNU General Public License v3 (https://github.com/bontchev/pcodedmp/blob/master/LICENSE)
# Version: 1.2.6
# Notes: 

{% set version = '1.2.6' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

include:
  - winfor.standalones.portable-python3

pcodedmp-folder-download-only:
  file.directory:
    - name: '{{ downloads }}\pcodedmp'
    - makedirs: True
    - force: True
    - win_inheritance: True

pcodedmp-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages pcodedmp'
    - cwd: '{{ downloads }}\pcodedmp\'
    - require:
      - sls: winfor.standalones.portable-python3
      - file: pcodedmp-folder-download-only
