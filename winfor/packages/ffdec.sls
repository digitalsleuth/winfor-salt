# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

ffdec:
  pkg.installed

ffdec-shortcut-remove:
  file.absent:
    - name: 'C:\Users\Public\Desktop\JPEXS Free Flash Decompiler.lnk'
    - require:
      - pkg: ffdec
