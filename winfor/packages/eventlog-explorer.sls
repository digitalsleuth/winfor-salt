# Name: Event Log Explorer
# Website: https://eventlogxp.com/
# Description: Windows Event Log Parser
# Category: Logs
# Author: FSPro
# License: Multiple (https://eventlogxp.com/order.html)
# Version: 5.5
# Notes:

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.repos

eventlog-explorer:
  pkg.installed

eventlog-explorer-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Event Log Explorer.lnk'
    - target: 'C:\Program Files (x86)\Event Log Explorer\elex.exe'
    - force: True
    - working_dir: 'C:\Program Files (x86)\Event Log Explorer\'
    - makedirs: True
    - require:
      - pkg: eventlog-explorer
