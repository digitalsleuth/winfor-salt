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

decompyle3-folder-download-only:
  file.directory:
    - name: '{{ downloads }}\decompyle3\'
    - force: True
    - makedirs: True
    - win_inheritance: True

decompyle3-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download decompyle3 -d packages'
    - cwd: '{{ downloads }}\decompyle3'
    - require:
      - sls: winfor.standalones.portable-python3
      - file: decompyle3-folder-download-only

