# Name: olefile
# Website: https://www.decalage.info/python/olefileio
# Description: Python module to read / write MS OLE2 files
# Category: Documents / Editors
# Author: Philippe Lagadec
# License: https://github.com/decalage2/olefile/blob/master/LICENSE.txt
# Version: 0.47
# Notes: 

{% set version = '0.47' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

include:
  - winfor.standalones.portable-python3

olefile-folder-download-only:
  file.directory:
    - name: '{{ downloads }}\olefile'
    - makedirs: True
    - force: True
    - win_inheritance: True

olefile-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages olefile'
    - cwd: '{{ downloads }}\olefile\'
    - require:
      - sls: winfor.standalones.portable-python3
      - file: olefile-folder-download-only
