# Name: x64dbg
# Website: https://sourceforge.net/projects/x64dbg/
# Description: Open Source x64/x32 debugger for Windows
# Category: Executables
# Author: Duncan Ogilvie (mrexodia)
# License: GNU General Public License v3 (https://github.com/x64dbg/x64dbg/blob/development/LICENSE)
# Version: 2022-12-02_11-56
# Notes: 

{% set version = '2022-12-02_11-56' %}
{% set hash = '87326F2315D767264F34ACC4FE11B2E7BE1FCAAAC5A77D16C677552753108E77' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

x64dbg-download:
  file.managed:
    - name: 'C:\salt\tempdownload\snapshot_{{ version }}.zip'
    - source: https://github.com/x64dbg/x64dbg/releases/download/snapshot/snapshot_{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

x64dbg-extract:
  archive.extracted:
    - name: 'C:\standalone\x64dbg'
    - source: 'C:\salt\tempdownload\snapshot_{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: x64dbg-download

winfor-standalones-x64dbg-shortcut-1:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\x64dbg.lnk'
    - target: 'C:\standalone\x64dbg\release\x64\x64dbg.exe'
    - force: True
    - working_dir: 'C:\standalone\x64dbg\release\x64\'
    - makedirs: True
    - require:
      - file: x64dbg-download
      - archive: x64dbg-extract

winfor-standalones-x64dbg-shortcut-2:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\x32dbg.lnk'
    - target: 'C:\standalone\x64dbg\release\x32\x32dbg.exe'
    - force: True
    - working_dir: 'C:\standalone\x64dbg\release\x32'
    - makedirs: True
    - require:
      - file: x64dbg-download
      - archive: x64dbg-extract
