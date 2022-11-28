# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

kernel-pst-viewer:
  pkg.installed

taskkill-pst-viewer-edge-window:
  cmd.run:
    - name: 'taskkill /F /IM "msedge.exe"'
    - bg: True
    - require:
      - pkg: kernel-pst-viewer
