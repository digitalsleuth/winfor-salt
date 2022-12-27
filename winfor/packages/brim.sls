# Name: Brim
# Website: https://www.brimdata.io/
# Description: Network Forensic GUI Tool using Zeek and Suricata
# Category: Network
# Author: Brim Data
# License: GNU General Public License (GPL) (https://github.com/brimdata/brim/blob/main/LICENSE.txt)
# Version: 0.31.0
# Notes:

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

brim:
  pkg.installed

brim-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Brim.lnk'
    - target: 'C:\Program Files\Brim\Brim.exe'
    - force: True
    - working_dir: 'C:\Program Files\Brim\'
    - makedirs: True
