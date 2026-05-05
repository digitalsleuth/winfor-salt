# Name: scdbg
# Website: http://sandsprite.com/blogs/index.php?uid=7&pid=152
# Description: Shellcode analysis tool
# Category: Executables
# Author: David Zimmer
# License: 
# Version: Jul 10 2023 14:21:55
# Notes: 

{% set version = '2023-07-10' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.config.shims

scdbg-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\scdbg\'
    - source: '{{ downloads }}\scdbg\scdbg-{{ version }}.zip'
    - enforce_toplevel: False

scdbg-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\scdbg\scdbg.exe -OutPath {{ inpath }}\shims\scdbg.exe'
    - require:
      - sls: winfor.config.shims

scdbg-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\SCDBG-GUI.lnk'
    - target: '{{ inpath }}\scdbg\gui_launcher.exe'
    - force: True
    - working_dir: '{{ inpath }}\scdbg\'
    - makedirs: True
    - require:
      - archive: scdbg-extract-offline
