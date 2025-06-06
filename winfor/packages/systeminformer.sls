# Name: System Informer
# Website: https://systeminformer.com
# Description: Process analysis and dumping tool
# Category: Executables
# Author: Steven G (dmex) / Wen Jia Liu / WinSiderss
# License: MIT License (https://github.com/winsiderss/systeminformer/blob/master/LICENSE.txt)
# Version: 3.2.25011.2103
# Notes: Formerly process hacker

{% set version = '3.2.25011.2103' %}

include:
  - winfor.repos

systeminformer:
  pkg.installed

taskkill-systeminformer-window:
  cmd.run:
    - name: 'taskkill /F /IM "SystemInformer.exe"'
    - bg: True
    - watch:
      - pkg: systeminformer

systeminformer-icon-remove:
  file.absent:
    - name: 'C:\Users\Public\Desktop\System Informer.lnk'
    - require:
      - pkg: systeminformer
