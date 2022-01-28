include:
  - winfor.packages.ms-vcpp-2015-build-tools

yara-python:
  pip.installed:
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.packages.ms-vcpp-2015-build-tools
