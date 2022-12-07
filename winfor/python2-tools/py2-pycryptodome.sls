# Name: Pycryptodome
# Website: https://github.com/legrandin/pycryptodome
# Description: Python package of low-level cryptographic primitives
# Category: Requirements
# Author: Helder Eijs (Legrandin)
# License: Public Domain / BSD (https://github.com/Legrandin/pycryptodome/blob/master/LICENSE.rst)
# Version: 3.16.0
# Notes: 

include:
  - winfor.packages.vcforpython27

py2-pycryptodome:
  pip.installed:
    - name: 'pycryptodome'
    - bin_env: 'C:\Python27\python.exe'
    - require:
      - sls: winfor.packages.vcforpython27
