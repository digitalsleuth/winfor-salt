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

include:
  - winfor.offline.packages.python3

decompyle3-move-folder-offline:
  file.rename:
    - name: '{{ inpath }}\decompyle3'
    - source: '{{ downloads }}\decompyle3'
    - makedirs: True
    - force: True

decompyle3-requirements-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages -r requirements.txt'
    - cwd: '{{ inpath }}\decompyle3\'
    - require:
      - sls: winfor.offline.packages.python3
      - file: decompyle3-move-folder-offline

decompyle3-install-offline:
  pip.installed:
    - name: '{{ inpath }}\decompyle3\'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - cmd: decompyle3-requirements-install-offline
