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
{% set hash = '6ba5dabb128d039d3712cc10eb798fcf7d34597751a119c62aa96bf83b86d6f7' %}

include:
  - winfor.standalones.portable-python3

analyzemft-download-only:
  file.managed:
    - name: '{{ downloads }}\analyzemft-{{ version }}.zip'
    - source: https://github.com/rowingdude/analyzeMFT/archive/refs/tags/v{{ version }}.0.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

analyzemft-extract-download-only:
  archive.extracted:
    - name: '{{ downloads }}\'
    - source: '{{ downloads }}\analyzemft-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: analyzemft-download-only

analyzemft-rename-download-only:
  file.rename:
    - name: '{{ downloads }}\analyzemft'
    - source: '{{ downloads }}\analyzeMFT-{{ version }}.0'
    - makedirs: True
    - force: True
    - require:
      - archive: analyzemft-extract-download-only

analyzemft-requirements-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -r requirements.txt -d packages'
    - cwd: '{{ downloads }}\analyzemft'
    - require:
      - file: analyzemft-download-only
      - archive: analyzemft-extract-download-only
      - sls: winfor.standalones.portable-python3

analyzemft-remove-zip-download-only:
  file.absent:
    - name: '{{ downloads }}\analyzemft-{{ version }}.zip'
    - require:
      - cmd: analyzemft-requirements-download-only
