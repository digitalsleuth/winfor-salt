# Name: Virtualbox
# Website: https://www.virtualbox.org/
# Description: Desktop virtualization software
# Category: Utilities
# Author: Oracle
# License: https://www.oracle.com/html/terms.html
# Version: 7.0.4-154605
# Notes: 

virtualbox:
  pkg.installed

remove-virtualbox-shortcut:
  file.absent:
    - name: 'C:\Users\Public\Desktop\Oracle VM VirtualBox.lnk'
    - require:
      - pkg: virtualbox
