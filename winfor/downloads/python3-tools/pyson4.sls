# Name: pyson4
# Website: https://github.com/digitalsleuth/pyson4
# Description: A python3 jsonlz4 file parser for Firefox
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: GNU General Public License v3 (https://github.com/digitalsleuth/pyson4/blob/master/LICENSE)
# Version: 1.2.0
# Notes: pyson4, pyson4.py

{% set version = '1.2.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '4a0255868a54ae86ebabb86511da172d6f079d363e7654919cbfae64078299b9' %}

include:
  - winfor.downloads.packages.python3
  - winfor.standalones.portable-python3

pyson4-download-only:
  file.managed:
    - name: '{{ downloads }}\pyson4-{{ version }}.zip'
    - source: https://github.com/digitalsleuth/pyson4/archive/refs/tags/v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

pyson4-extract-download-only:
  archive.extracted:
    - name: '{{ downloads }}\'
    - source: '{{ downloads }}\pyson4-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: pyson4-download-only

pyson4-folder-rename-download-only:
  file.rename:
    - name: '{{ downloads }}\pyson4'
    - source: '{{ downloads }}\pyson4-{{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: pyson4-extract-download-only

pyson4-requirements-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages . setuptools wheel'
    - cwd: '{{ downloads }}\pyson4'
    - require:
      - sls: winfor.downloads.packages.python3
      - sls: winfor.standalones.portable-python3
      - file: pyson4-folder-rename-download-only

pyson4-remove-download-only:
  file.absent:
    - name: '{{ downloads }}\pyson4-{{ version }}.zip'
    - require:
      - cmd: pyson4-requirements-download-only
