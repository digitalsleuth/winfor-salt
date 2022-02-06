# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

registry-viewer:
  pkg.installed

registry-viewer-del-shortcut:
  file.absent:
    - name: 'C:\Users\Public\Desktop\Registry Viewer.lnk'
    - require:
      - pkg: registry-viewer
