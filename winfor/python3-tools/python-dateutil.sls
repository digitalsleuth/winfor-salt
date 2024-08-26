# Name: python-dateutil
# Website: https://github.com/dateutil/dateutil
# Description: Python module to use standard datetime features
# Category: Requirements
# Author: https://github.com/dateutil/dateutil/blob/master/AUTHORS.md
# License: Apache License v2.0 (https://github.com/dateutil/dateutil/blob/master/LICENSE)
# Version: 2.8.2
# Notes: 

include:
  - winfor.packages.python3

python-dateutil:
  pip.installed:
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.packages.python3
