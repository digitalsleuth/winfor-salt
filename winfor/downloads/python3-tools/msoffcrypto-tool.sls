# Name: msoffcrypto-tool
# Website: https://github.com/nolze/msoffcrypto-tool
# Description: Python library for decrypting encrypted MS Office Files
# Category: Documents / Editors
# Author: Nolze
# License: MIT License (https://github.com/nolze/msoffcrypto-tool/blob/master/LICENSE.txt)
# Version: 5.4.2
# Notes:

{% set version = '5.4.2' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

include:
  - winfor.standalones.portable-python3

msoffcrypto-tool-folder-download-only:
  file.directory:
    - name: '{{ downloads }}\msoffcrypto-tool'
    - win_inheritance: True
    - makedirs: True

msoffcrypto-tool-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages msoffcrypto-tool'
    - cwd: '{{ downloads }}\msoffcrypto-tool'
    - require:
      - sls: winfor.standalones.portable-python3
      - file: msoffcrypto-tool-folder-download-only
