# Name: Fakenet-NG
# Website: https://github.com/mandiant/flare-fakenet-ng
# Description: Next Generation Dynamic Network Analysis Tool
# Category: Network
# Author: https://github.com/mandiant/flare-fakenet-ng/blob/master/AUTHORS
# License: Apache License 2.0 (https://github.com/mandiant/flare-fakenet-ng/blob/master/LICENSE.txt)
# Version: 1.4.12
# Notes: 

include:
  - winfor.packages.git
  - winfor.packages.python2
  - winfor.packages.ms-vcpp-2015-build-tools

flare-fakenet-ng:
  pip.installed:
    - name: 'git+https://github.com/mandiant/flare-fakenet-ng.git'
    - bin_env: 'C:\Python27\python.exe'
    - require:
      - sls: winfor.packages.git
      - sls: winfor.packages.ms-vcpp-2015-build-tools
