# Name: Ghidra
# Website: https://github.com/NationalSecurityAgency/ghidra
# Description: Software Reverse Engineering framework
# Category: Executables
# Author: National Security Agency
# License: Apache License 2.0 (https://github.com/NationalSecurityAgency/ghidra/blob/master/LICENSE)
# Version: 12.0.4
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set version = '12.0.4' %}
{% set date = '20260303' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.offline.packages.jdk21

ghidra-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\ghidra\ghidra_{{ version }}_PUBLIC_{{ date }}.zip'
    - enforce_toplevel: False
    - require:
      - sls: winfor.offline.packages.jdk21

ghidra-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\ghidra'
    - source: '{{ inpath }}\ghidra_{{ version }}_PUBLIC\'
    - force: True
    - makedirs: True
    - require:
      - archive: ghidra-extract-offline

ghidra-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Ghidra.lnk'
    - target: '{{ inpath }}\ghidra\ghidraRun.bat'
    - force: True
    - working_dir: '{{ inpath }}\ghidra\'
    - icon_location: '{{ inpath }}\ghidra\support\ghidra.ico'
    - makedirs: True
    - require:
      - archive: ghidra-extract-offline
      - file: ghidra-folder-rename-offline
