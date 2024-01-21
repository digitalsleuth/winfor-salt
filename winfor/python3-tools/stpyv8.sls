# Name: STPyV8
# Website: https://github.com/cloudflare/stpyv8
# Description: Python3 and JavaScript interop engine, fork of the original PyV8 project
# Category: Requirements
# Author: Area1 Security
# License: Apache License 2.0: https://github.com/cloudflare/stpyv8/blob/master/LICENSE.txt
# Version: 12.0.267.16
# Notes:

{% set version = '12.0.267.16' %}
{% set hash = 'f2dd4a688c6d09d4b688b048c925db99c91fc8a9330572a625c563d6d62f3efe' %}

include:
  - winfor.packages.python3

stpyv8-download:
  file.managed:
    - name: 'C:\salt\tempdownload\stpyv8-{{ version }}-cp310-cp310-win_amd64.whl'
    - source: https://github.com/cloudflare/stpyv8/releases/download/v{{ version }}/stpyv8-{{ version }}-cp310-cp310-win_amd64.whl
    - source_hash: sha256={{ hash }}
    - makedirs: True

stpyv8-install:
  pip.installed:
    - name: 'C:\salt\tempdownload\stpyv8-{{ version }}-cp310-cp310-win_amd64.whl'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.packages.python3
