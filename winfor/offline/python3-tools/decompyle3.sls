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
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'packages\\decompyle3-' ~ version ~ '-py3-none-any.whl' %}
{% set exists = salt['file.file_exists'](downloads + '\\decompyle3\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.python3

decompyle3-move-folder-offline:
  file.rename:
    - name: '{{ inpath }}\decompyle3'
    - source: '{{ downloads }}\decompyle3'
    - makedirs: True
    - force: True

decompyle3-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages decompyle3'
    - cwd: '{{ inpath }}\decompyle3\'
    - require:
      - sls: winfor.offline.packages.python3
      - file: decompyle3-move-folder-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
