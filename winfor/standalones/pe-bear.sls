# Name: PE-bear
# Website: https://github.com/hasherezade/pe-bear
# Description: Portable Executable reversing tool with a GUI
# Category: Executables
# Author: hasherezade
# License: GNU General Public License v2 (https://github.com/hasherezade/pe-bear/blob/main/LICENSE)
# Version: 0.6.1
# Notes: 

{% set version = '0.6.1' %}
{% set hash = 'e08dd503d5699e593c7609d2d58ab73740c33a4d97bf887682349fe2f4d8a028' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

pe-bear-download:
  file.managed:
    - name: 'C:\salt\tempdownload\PE-bear_{{ version }}_x64_win_vs17.zip'
    - source: https://github.com/hasherezade/pe-bear/releases/download/v{{ version }}/PE-bear_{{ version }}_x64_win_vs17.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

pe-bear-extract:
  archive.extracted:
    - name: 'C:\standalone\pe-bear'
    - source: 'C:\salt\tempdownload\PE-bear_{{ version }}_x64_win_vs17.zip'
    - enforce_toplevel: False
    - require:
      - file: pe-bear-download

pe-bear-sig-download:
  file.managed:
    - name: 'C:\standalone\pe-bear\SIG.txt'
    - source: https://github.com/hasherezade/pe-bear/raw/main/SIG.txt
    - source_hash: sha256=247627cd61b15afd711dd88988a8622cef50e97b5b2a0ddfe9fcfc3eae29d2f1
    - makedirs: True
    - require:
      - archive: pe-bear-extract

winfor-standalones-pe-bear-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\PE-Bear.lnk'
    - target: 'C:\standalone\pe-bear\PE-bear.exe'
    - force: True
    - working_dir: 'C:\standalone\pe-bear\'
    - makedirs: True
    - require:
      - file: pe-bear-download
      - archive: pe-bear-extract
