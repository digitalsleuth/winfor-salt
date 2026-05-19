# Name: pyson4
# Website: https://github.com/digitalsleuth/pyson4
# Description: A python3 jsonlz4 file parser for Firefox
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: GNU General Public License v3 (https://github.com/digitalsleuth/pyson4/blob/master/LICENSE)
# Version: 1.2
# Notes: pyson4, pyson4.py

{% set version = '1.2' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

include:
  - winfor.downloads.packages.python3
  - winfor.standalones.portable-python3
  - winfor.packages.git

pyson4-folder-download-only:
  file.directory:
    - name: '{{ downloads }}\pyson4'
    - makedirs: True
    - force: True

pyson4-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages git+https://github.com/digitalsleuth/pyson4'
    - cwd: '{{ downloads }}\pyson4'
    - require:
      - sls: winfor.downloads.packages.python3
      - sls: winfor.standalones.portable-python3
      - sls: winfor.packages.git
      - file: pyson4-folder-download-only
