# Name: analyzeMFT
# Website: https://github.com/rowingdude/analyzemft
# Description: Python tool to fully parse the MFT from an NTFS file system
# Category: Windows Analysis
# Author: Benjamin Cance (rowingdude)
# License: MIT License (https://github.com/rowingdude/analyzeMFT/blob/master/LICENSE.txt)
# Version: 3.1.1
# Notes:

{% set version = '3.1.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('analyzemft') %}

include:
  - winfor.standalones.portable-python3

analyzemft-directory-download-only:
  file.directory:
    - name: '{{ downloads }}\analyzemft'
    - force: True
    - makedirs: True
    - win_inheritance: True

analyzemft-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages analyzeMFT'
    - cwd: '{{ downloads }}\analyzemft'
    - require:
      - file: analyzemft-directory-download-only
      - sls: winfor.standalones.portable-python3
