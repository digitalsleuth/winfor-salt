# Name: plaso (super timeline all the things)
# Website: https://plaso.readthedocs.io/en/latest/
# Description: Python 3 tool to generate a timeline of all artifacts
# Category: Acquisition and Analysis
# Author: https://github.com/log2timeline/plaso/blob/main/AUTHORS
# License: Apache License v2 (https://github.com/log2timeline/plaso/blob/main/LICENSE)
# Version: 20231224
# Notes: log2timeline.py, psort.py, psteal.py

include:
  - winfor.packages.git
  - winfor.packages.python3

plaso:
  pip.installed:
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.packages.git
      - sls: winfor.packages.python3

