# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

ftk-imager:
  pkg.installed

ftk-imager-icon-remove:
  file.absent:
    - name: 'C:\Users\Public\Desktop\AccessData FTK Imager.lnk'
    - require:
      - pkg: ftk-imager
