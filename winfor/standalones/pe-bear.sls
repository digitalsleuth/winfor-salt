# Name: PE-bear
# Website: https://github.com/hasherezade/pe-bear
# Description: Portable Executable reversing tool with a GUI
# Category: Executables
# Author: hasherezade
# License: GNU General Public License v2 (https://github.com/hasherezade/pe-bear/blob/main/LICENSE)
# Version: 0.6.7.3
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '0.6.7.3' %}
{% set hash = '22146f303e29de8e00c327ed8d32c46a86eb351875447859286962d11ddb25cc' %}
{% set sig_hash = 'b9b091d99c6263978eaf387ed18d9a743f88e7e3f5fd959ecc9057461fd981fc' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

pe-bear-download:
  file.managed:
    - name: 'C:\salt\tempdownload\PE-bear_{{ version }}_x64_win_vs19.zip'
    - source: https://github.com/hasherezade/pe-bear/releases/download/v{{ version }}/PE-bear_{{ version }}_x64_win_vs19.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

pe-bear-extract:
  archive.extracted:
    - name: '{{ inpath }}\pe-bear'
    - source: 'C:\salt\tempdownload\PE-bear_{{ version }}_x64_win_vs19.zip'
    - enforce_toplevel: False
    - require:
      - file: pe-bear-download

pe-bear-sig-download:
  file.managed:
    - name: '{{ inpath }}\pe-bear\SIG.txt'
    - source: https://github.com/hasherezade/pe-bear/raw/main/SIG.txt
    - source_hash: sha256={{ sig_hash }}
    - makedirs: True
    - require:
      - archive: pe-bear-extract

standalones-pe-bear-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\PE-Bear.lnk'
    - target: '{{ inpath }}\pe-bear\PE-bear.exe'
    - force: True
    - working_dir: '{{ inpath }}\pe-bear\'
    - makedirs: True
    - require:
      - file: pe-bear-download
      - archive: pe-bear-extract
