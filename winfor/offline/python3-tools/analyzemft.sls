# Name: analyzeMFT
# Website: https://github.com/rowingdude/analyzemft
# Description: Python tool to fully parse the MFT from an NTFS file system
# Category: Windows Analysis
# Author: Benjamin Cance (rowingdude)
# License: MIT License (https://github.com/rowingdude/analyzeMFT/blob/master/LICENSE.txt)
# Version: 3.1.1
# Notes:

{% set version = '3.1.1' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'analyzemft-'~ version ~'-py3-none-any.whl' %}
{% set exists = salt['file.file_exists'](downloads + '\\analyzemft\\packages\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3

analyzemft-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages analyzemft'
    - cwd: '{{ downloads }}\analyzemft\'
    - require:
      - sls: winfor.offline.packages.python3

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
