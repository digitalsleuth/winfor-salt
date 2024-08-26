# Name: yara-python
# Website: https://github.com/VirusTotal/yara-python
# Description: Analyze files by generating rules around data to be found
# Category: Raw Parsers / Decoders
# Author: Victor M. Alvarez (plusvic)
# License: Apache License v2.0 (https://github.com/VirusTotal/yara-python/blob/master/LICENSE)
# Version: 4.2.3
# Notes: 

include:
  - winfor.packages.ms-vcpp-2015-build-tools
  - winfor.packages.python3

yara-python:
  pip.installed:
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.packages.ms-vcpp-2015-build-tools
      - sls: winfor.packages.python3
