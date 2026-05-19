# Name: peepdf-3
# Website: https://github.com/digitalsleuth/peepdf-3
# Description: PDF analysis and malicious code analyzer.
# Category: Documents / Editors
# Author: Jose Miguel Esparza and Corey Forman
# License: GNU General Public License (GPL) v3: https://github.com/digitalsleuth/peepdf-3/blob/main/COPYING
# Version: 5.3.0
# Notes:

{% set version = '5.3.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

include:
  - winfor.standalones.portable-python3
  - winfor.downloads.python3-tools.stpyv8

peepdf-3-folder-download-only:
  file.directory:
    - name: '{{ downloads }}\peepdf-3'
    - makedirs: True
    - force: True
    - win_inheritance: True

peepdf-3-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages peepdf-3'
    - cwd: '{{ downloads }}\peepdf-3\'
    - require:
      - sls: winfor.standalones.portable-python3
      - file: peepdf-3-folder-download-only
      - sls: winfor.downloads.python3-tools.stpyv8
