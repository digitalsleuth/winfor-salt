# Name: STPyV8
# Website: https://github.com/cloudflare/stpyv8
# Description: Python3 and JavaScript interop engine, fork of the original PyV8 project
# Category: Requirements
# Author: Area1 Security
# License: Apache License 2.0: https://github.com/cloudflare/stpyv8/blob/master/LICENSE.txt
# Version: 12.0.267.16
# Notes:

{% set version = '12.0.267.16' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

include:
  - winfor.standalones.portable-python3

stpyv8-folder-download-only:
  file.directory:
    - name: '{{ downloads }}\stpyv8'
    - makedirs: True
    - force: True
    - win_inheritance: True
    - require:
      - sls: winfor.standalones.portable-python3

stpyv8-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages stpyv8=={{ version }}'
    - cwd: '{{ downloads }}\stpyv8'
    - require:
      - sls: winfor.standalones.portable-python3

