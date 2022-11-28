# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

mdf-viewer:
  pkg.installed

taskkill-mdf-viewer-edge-window:
  cmd.run:
    - name: 'taskkill /F /IM "msedge.exe"'
    - bg: True
    - require:
      - pkg: mdf-viewer
