# Name: Voidtools Everything
# Website: https://www.voidtools.com
# Description: File Search Utility
# Category: Utilities
# Author: David Carpenter
# License: https://www.voidtools.com/License.txt
# Version: 1.4.1.1022
# Notes: 

include:
  - winfor.repos

voidtools-everything:
  pkg.installed

voidtools-everything-remove-shortcut:
  file.absent:
    - name: 'C:\Users\Public\Desktop\Everything.lnk'
    - require:
      - pkg: voidtools-everything
