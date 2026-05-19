# Name: oletools
# Website: http://www.decalage.info/python/oletools
# Description: Package of tools to analyze MS OLE2 files
# Category: Documents / Editors
# Author: Philippe Lagadec
# License: https://github.com/decalage2/oletools/blob/master/LICENSE.md
# Version: 0.60.2
# Notes: 

{% set version = '0.60.2' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

include:
  - winfor.standalones.portable-python3

oletools-folder-download-only:
  file.directory:
    - name: '{{ downloads }}\oletools'
    - makedirs: True
    - force: True
    - win_inheritance: True

oletools-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages oletools'
    - cwd: '{{ downloads }}\oletools\'
    - require:
      - sls: winfor.standalones.portable-python3
      - file: oletools-folder-download-only
