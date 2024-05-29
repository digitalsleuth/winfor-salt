# Name: maldump
# Website: https://github.com/NUKIB/maldump
# Description: Python 3 tool for extracting quarantined files from a live system or mounted image
# Category: Executables
# Author: Czech Republic National Cyber and Information Security Agency
# License: https://github.com/NUKIB/maldump/blob/main/LICENSE
# Version: 0.3.0
# Notes: 

include:
  - winfor.packages.git
  - winfor.packages.python3

maldump-requirements:
  pip.installed:
    - requirements: https://raw.githubusercontent.com/NUKIB/maldump/main/requirements.txt
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.packages.python3

maldump-install:
  pip.installed:
    - name: git+https://github.com/NUKIB/maldump.git
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.packages.git
      - sls: winfor.packages.python3

