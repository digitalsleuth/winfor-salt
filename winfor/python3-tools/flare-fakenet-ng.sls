# Name: Fakenet-NG
# Website: https://github.com/mandiant/flare-fakenet-ng
# Description: Next Generation Dynamic Network Analysis Tool
# Category: Network
# Author: https://github.com/mandiant/flare-fakenet-ng/blob/master/AUTHORS
# License: Apache License 2.0 (https://github.com/mandiant/flare-fakenet-ng/blob/master/LICENSE.txt)
# Version: 3.5
# Notes: 

{% set version = '3.5' %}

include:
  - winfor.packages.git
  - winfor.packages.python3
  - winfor.packages.ms-vcpp-2015-build-tools

flare-fakenet-ng:
  pip.installed:
    - name: 'git+https://github.com/mandiant/flare-fakenet-ng.git'
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.packages.git
      - sls: winfor.packages.python3
      - sls: winfor.packages.ms-vcpp-2015-build-tools
