# Name: STPyV8
# Website: https://github.com/cloudflare/stpyv8
# Description: Python3 and JavaScript interop engine, fork of the original PyV8 project
# Category: Requirements
# Author: Area1 Security
# License: Apache License 2.0: https://github.com/cloudflare/stpyv8/blob/master/LICENSE.txt
# Version: 12.0.267.16
# Notes:

{% set version = '12.0.267.16' %}

include:
  - winfor.packages.python3

stpyv8-install:
  pip.installed:
    - name: stpyv8=={{ version }}
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.packages.python3
