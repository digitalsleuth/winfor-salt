# Name: STPyV8
# Website: https://github.com/cloudflare/stpyv8
# Description: Python3 and JavaScript interop engine, fork of the original PyV8 project
# Category: Requirements
# Author: Area1 Security
# License: Apache License 2.0: https://github.com/cloudflare/stpyv8/blob/master/LICENSE.txt
# Version: 12.0.267.16
# Notes:

{% set version = '12.0.267.16' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.offline.packages.python3

stpyv8-install-offline:
  cmd.run:
    - name: '"C:\Program Files\Python310\python.exe" -m pip install --no-index --find-links=.\packages stpyv8=={{ version }}'
    - cwd: '{{ downloads }}\stpyv8\'
    - require:
      - sls: winfor.offline.packages.python3

