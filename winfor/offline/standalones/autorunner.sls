# Name: Autorunner
# Website: https://github.com/woanware/autorunner
# Description: Checks for autorun applications on Windows
# Category: Windows Analysis
# Author: Mark Woan
# License: Public Domain
# Version: 0.0.16
# Notes: 

{% set version = '0.0.16' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.offline.standalones.sysinternals
  - winfor.config.shims

autorunner-extracted-offline:
  archive.extracted:
    - name: '{{ inpath }}\autorunner\'
    - source: '{{ downloads }}\autorunner\autorunner.v{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - sls: winfor.offline.standalones.sysinternals

autorunner-config-1-offline:
  file.directory:
    - name: '{{ inpath }}\autorunner\Tools'
    - win_inheritance: True
    - makedirs: True
    - require:
      - archive: autorunner-extracted-offline

autorunner-config-2-offline:
  file.symlink:
    - name: '{{ inpath }}\autorunner\Tools\sigcheck.exe'
    - target: '{{ inpath }}\sysinternals\sigcheck.exe'
    - force: True
    - makedirs: True
    - win_inheritance: True
    - require:
      - file: autorunner-config-1-offline

autorunner-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\autorunner\autorunner.exe -OutPath {{ inpath }}\shims\autorunner.exe'
    - require:
      - sls: winfor.config.shims

autorunner-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\AutoRunner.lnk'
    - target: '{{ inpath }}\autorunner\autorunner.exe'
    - force: True
    - working_dir: '{{ inpath }}\autorunner\'
    - makedirs: True
    - require:
      - archive: autorunner-extracted-offline
