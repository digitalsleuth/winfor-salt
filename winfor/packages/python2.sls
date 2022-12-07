# Name: Python 2
# Website: https://www.python.org
# Description: Python Programming Language Framework
# Category: Requirements
# Author: Python Software Foundation
# License: Python Software Foundation License Version 2.0 (https://docs.python.org/2.7/license.html)
# Version: 2.7.18
# Notes: 

python2_x64:
  pkg.installed

python2-env-vars:
  win_path.exists:
    - names:
      - 'C:\Python27\Scripts'
      - 'C:\Python27'
    - index: -1

python2-symlink:
  file.symlink:
    - name: 'C:\Python27\python2.exe'
    - target: 'C:\Python27\python.exe'
    - force: True
    - makedirs: True
    - win_inheritance: True
    - require:
      - pkg: python2_x64
