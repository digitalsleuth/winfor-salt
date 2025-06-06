# Name: Ghidra
# Website: https://github.com/NationalSecurityAgency/ghidra
# Description: Software Reverse Engineering framework
# Category: Executables
# Author: National Security Agency
# License: Apache License 2.0 (https://github.com/NationalSecurityAgency/ghidra/blob/master/LICENSE)
# Version: 11.3.2
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '11.3.2' %}
{% set hash = '99d45035bdcc3d6627e7b1232b7b379905a9fad76c772c920602e2b5d8b2dac2' %}
{% set date = '20250415' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.jdk21

ghidra-download:
  file.managed:
    - name: 'C:\salt\tempdownload\ghidra_{{ version }}_PUBLIC_{{ date }}.zip'
    - source: https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_{{ version }}_build/ghidra_{{ version }}_PUBLIC_{{ date }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - sls: winfor.packages.jdk21

ghidra-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\ghidra_{{ version }}_PUBLIC_{{ date }}.zip'
    - enforce_toplevel: False
    - require:
      - file: ghidra-download

ghidra-folder-rename:
  file.rename:
    - name: '{{ inpath }}\ghidra'
    - source: '{{ inpath }}\ghidra_{{ version }}_PUBLIC\'
    - force: True
    - makedirs: True
    - require:
      - archive: ghidra-extract

ghidra-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Ghidra.lnk'
    - target: '{{ inpath }}\ghidra\ghidraRun.bat'
    - force: True
    - working_dir: '{{ inpath }}\ghidra\'
    - icon_location: '{{ inpath }}\ghidra\support\ghidra.ico'
    - makedirs: True
    - require:
      - file: ghidra-download
      - archive: ghidra-extract
