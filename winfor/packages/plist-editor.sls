# Name: Plist Editor
# Website: https://www.icopybot.com
# Description: Mac PList viewing tool
# Category: Mobile Analysis
# Author: VOW Software Studio
# License: End User License Agreement
# Version: 2.5.0
# Notes: Free Trial

plist-editor:
  pkg.installed

plist-editor-shortcut:
  file.absent:
    - name: 'C:\Users\Public\Desktop\plist Editor Pro.lnk'
    - require:
      - pkg: plist-editor

