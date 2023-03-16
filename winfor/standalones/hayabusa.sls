# Name: Hayabusa
# Website: https://github.com/Yamato-Security/hayabusa
# Description: Windows event log fast forensics timeline generator and threat hunting tool 
# Category: Windows Analysis
# Author: Yamato Security
# License: GNU General Public License v3.0 (https://github.com/Yamato-Security/hayabusa/blob/main/LICENSE.txt)
# Version: 2.3.0
# Notes:

{% set version = '2.3.0' %}
{% set hash = '38D48809D0E608AF51876585C241CE46997714084F35D7B8F49831F10FB725D0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

hayabusa-download:
  file.managed:
    - name: 'C:\salt\tempdownload\hayabusa-{{ version }}-win-all.zip'
    - source:https://github.com/Yamato-Security/hayabusa/releases/download/v{{ version }}/hayabusa-{{ version }}-win-64-bit.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

hayabusa-extract:
  archive.extracted:
    - name: '{{ inpath }}\hayabusa'
    - source: 'C:\salt\tempdownload\hayabusa-{{ version }}-win-64-bit.zip'
    - enforce_toplevel: False
    - overwrite: True
    - require:
      - file: hayabusa-download

hayabusa-rename:
  file.rename:
    - name: '{{ inpath }}\hayabusa\hayabusa.exe'
    - source: '{{ inpath }}\hayabusa\hayabusa{{ version }}-win-x64.exe'
    - force: True
    - require:
      - archive: hayabusa-extract

hayabusa-env:
  win_path.exists:
    - name: '{{ inpath }}\hayabusa\'
    
