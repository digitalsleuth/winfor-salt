# Name: Zui
# Website: https://www.brimdata.io/
# Description: Network Forensic GUI Tool using Zeek, Suricata and Zed
# Category: Network
# Author: Brim Data
# License: GNU General Public License (GPL) (https://github.com/brimdata/zui/blob/main/apps/zui/LICENSE.txt)
# Version: 1.3.0
# Notes:

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.repos

zui:
  pkg.installed

zui-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Zui.lnk'
    - target: 'C:\Program Files\Zui\Zui.exe'
    - force: True
    - working_dir: 'C:\Program Files\Zui\'
    - makedirs: True
