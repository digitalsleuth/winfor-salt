# Name: maldump
# Website: https://github.com/NUKIB/maldump
# Description: Python 3 tool for extracting quarantined files from a live system or mounted image
# Category: Executables
# Author: Czech Republic National Cyber and Information Security Agency
# License: https://github.com/NUKIB/maldump/blob/main/LICENSE
# Version: 0.5.0
# Notes:

{% set version = '0.5.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

include:
  - winfor.standalones.portable-python3

maldump-folder-download-only:
  file.directory:
    - name: '{{ downloads }}\maldump'
    - win_inheritance: True
    - makedirs: True

maldump-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages maldump'
    - cwd: '{{ downloads }}\maldump'
    - require:
      - sls: winfor.standalones.portable-python3
      - file: maldump-folder-download-only
