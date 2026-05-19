# Name: MS Word Parser
# Website: https://github.com/jjrboucher/MS-Word-Parser
# Description: MS Word document analysis tool
# Category: Documents / Editors
# Author: Jacques Boucher (jjrboucher) / Corey Forman (digitalsleuth)
# License: MIT License (https://github.com/jjrboucher/MS-Word-Parser/blob/master/LICENSE)
# Version: 3.0.1
# Notes:

{% set version = "3.0.1" %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

include:
  - winfor.standalones.portable-python3

ms-word-parser-folder-download-only:
  file.directory:
    - name: '{{ downloads }}\ms-word-parser'
    - makedirs: True
    - force: True
    - win_inheritance: True

ms-word-parser-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages ms-word-parser'
    - cwd: '{{ downloads }}\ms-word-parser\'
    - require:
      - sls: winfor.standalones.portable-python3
      - file: ms-word-parser-folder-download-only
