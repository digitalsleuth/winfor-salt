# Name: NAFT - Network Appliance Forensic Toolkit
# Website: https://github.com/digitalsleuth/naft
# Description: Updated version of Didier Stevens Network Appliance memory dump analyzer
# Category: Network
# Author: Corey Forman / Gabriel Cossette / Didier Stevens
# License: MIT License (https://github.com/digitalsleuth/naft/blob/main/LICENSE.md)
# Version: 1.0.0b1
# Notes: 

include:
  - winfor.packages.python3
  - winfor.python3-tools.python-dateutil

python3-naft:
  pip.installed:
    - name: git+https://github.com/digitalsleuth/naft
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - require:
      - sls: winfor.packages.python3
      - sls: winfor.python3-tools.python-dateutil
