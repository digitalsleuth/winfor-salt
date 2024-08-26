# Name: Registry Viewer
# Website: https://exterro.com
# Description: Windows Registry hive viewer
# Category: Registry
# Author: AccessData / Exterro
# License: EULA
# Version: 2.0.0.7
# Notes: 

include:
  - winfor.repos

registry-viewer:
  pkg.installed

registry-viewer-del-shortcut:
  file.absent:
    - name: 'C:\Users\Public\Desktop\Registry Viewer.lnk'
    - require:
      - pkg: registry-viewer
