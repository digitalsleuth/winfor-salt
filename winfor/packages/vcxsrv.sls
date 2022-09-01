# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

vcxsrv:
  pkg.installed

vcxsrv-del-shortcut:
  file.absent:
    - name: 'C:\Users\Public\Desktop\XLaunch.lnk'
    - require:
      - pkg: vcxsrv
