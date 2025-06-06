# Name: Virtualbox
# Website: https://www.virtualbox.org/
# Description: Desktop virtualization software
# Category: Utilities
# Author: Oracle
# License: https://www.oracle.com/html/terms.html
# Version: 7.1.10-169112
# Notes: 

include:
  - winfor.repos

virtualbox:
  pkg.installed

remove-virtualbox-shortcut:
  file.absent:
    - name: 'C:\Users\Public\Desktop\Oracle VirtualBox.lnk'
    - require:
      - pkg: virtualbox
