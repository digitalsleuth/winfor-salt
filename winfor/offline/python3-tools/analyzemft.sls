# Name: analyzeMFT
# Website: https://github.com/rowingdude/analyzemft
# Description: Python tool to fully parse the MFT from an NTFS file system
# Category: Windows Analysis
# Author: Benjamin Cance (rowingdude)
# License: MIT License (https://github.com/rowingdude/analyzeMFT/blob/master/LICENSE.txt)
# Version: 3.1.1.
# Notes:

{% set version = '3.1.1' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.offline.packages.python3

analyzemft-install-requirements-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages -r requirements.txt'
    - cwd: '{{ downloads }}\analyzemft\'
    - require:
      - sls: winfor.offline.packages.python3

analyzemft-install-offline:
  pip.installed:
    - name: '{{ downloads }}\analyzemft'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - upgrade: True
    - require:
      - sls: winfor.offline.packages.python3
