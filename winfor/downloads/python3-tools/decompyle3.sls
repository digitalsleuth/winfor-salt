# Name: Decompyle3
# Website: https://github.com/rocky/python-decompile3/
# Description: Python3 bytecode decompiler
# Category: Executables
# Author: Rocky R. Bernstein
# License: GNU General Public License v3 (https://github.com/rocky/python-decompile3/blob/master/COPYING)
# Version: 3.9.3
# Notes:

{% set version = '3.9.3' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '6608f92f1f8f56a970252b6dff52ee96b7bebafa3cae8352a3c624f5b7f4c348' %}

include:
  - winfor.standalones.portable-python3

decompyle3-download-only:
  file.managed:
    - name: '{{ downloads }}\decompyle3-{{ version }}.zip'
    - source: https://github.com/rocky/python-decompile3/archive/refs/tags/{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

decompyle3-extract-download-only:
  archive.extracted:
    - name: '{{ downloads }}\'
    - source: '{{ downloads }}\decompyle3-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: decompyle3-download-only

decompyle3-folder-rename-download-only:
  file.rename:
    - name: '{{ downloads }}\decompyle3'
    - source: '{{ downloads }}\python-decompile3-{{ version }}'
    - makedirs: True
    - force: True
    - require:
      - archive: decompyle3-extract-download-only

decompyle3-requirements-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download hypothesis==6.24.2 pytest~=7.1.3 Click~=7.0 "xdis>=6.0.4" configobj~=5.0.6 setuptools -d packages'
    - cwd: '{{ downloads }}\decompyle3'
    - require:
      - sls: winfor.standalones.portable-python3
      - archive: decompyle3-extract-download-only

decompyle3-remove-archive-download-only:
  file.absent:
    - name: '{{ downloads }}\decompyle3-{{ version }}.zip'
    - require:
      - cmd: decompyle3-requirements-download-only

