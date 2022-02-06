# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

include:
  - winfor.packages.git
  - winfor.packages.ms-vcpp-2015-build-tools

flare-fakenet-ng:
  pip.installed:
    - name: 'git+https://github.com/mandiant/flare-fakenet-ng.git'
    - bin_env: 'C:\Python27\python.exe'
    - require:
      - sls: winfor.packages.git
      - sls: winfor.packages.ms-vcpp-2015-build-tools
