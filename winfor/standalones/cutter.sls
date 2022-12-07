# Name: Cutter
# Website: https://github.com/rizinorg/cutter
# Description: Reverse Engineering Platform powered by rizin
# Category: Executables
# Author: Rizin Organization
# License: GNU General Public License v3 (https://github.com/rizinorg/cutter/blob/dev/COPYING)
# Version: 2.1.2
# Notes: 

{% set version = '2.1.2' %}
{% set hash = '9bd08fc9d5591149d3e6fee3e269458e3781706c09c2c1ff49355e48d27c0486' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

cutter-download:
  file.managed:
    - name: 'C:\salt\tempdownload\Cutter-v{{ version }}-Windows-x86_64.zip'
    - source: https://github.com/rizinorg/cutter/releases/download/v{{ version }}/Cutter-v{{ version }}-Windows-x86_64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

cutter-extract:
  archive.extracted:
    - name: 'C:\standalone\'
    - source: 'C:\salt\tempdownload\Cutter-v{{ version }}-Windows-x86_64.zip'
    - enforce_toplevel: False
    - require:
      - file: cutter-download

cutter-folder-rename:
  file.rename:
    - name: 'C:\standalone\cutter'
    - source: 'C:\standalone\cutter-v{{ version }}-Windows-x86_64\'
    - force: True
    - makedirs: True
    - require:
      - archive: cutter-extract

winfor-standalones-cutter-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Cutter.lnk'
    - target: 'C:\standalone\cutter\cutter.exe'
    - force: True
    - working_dir: 'C:\standalone\cutter\'
    - makedirs: True
    - require:
      - file: cutter-download
      - archive: cutter-extract

