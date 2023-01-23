# Name: KsDumper 11
# Website: https://github.com/mastercodeon314/KsDumper-11
# Description: Kernel Space Dumper utility
# Category: Executables
# Author: mastercodeon314
# License: None at this time
# Version: 1.0
# Notes:

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

ksdumper11:
  pkg.installed

ksdumper11-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\KsDumper11.lnk'
    - target: 'C:\Program Files\KsDumper11\KsDumper11.exe'
    - force: True
    - working_dir: 'C:\Program Files\KsDumper11'
    - makedirs: True
    - require:
      - pkg: ksdumper11
