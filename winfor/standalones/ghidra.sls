# Name: Ghidra
# Website: https://github.com/NationalSecurityAgency/ghidra
# Description: Software Reverse Engineering framework
# Category: Executables
# Author: National Security Agency
# License: Apache License 2.0 (https://github.com/NationalSecurityAgency/ghidra/blob/master/LICENSE)
# Version: 12.0.4
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '12.0.4' %}
{% set hash = 'c3b458661d69e26e203d739c0c82d143cc8a4a29d9e571f099c2cf4bda62a120' %}
{% set date = '20260303' %}
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
