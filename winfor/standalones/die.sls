# Name: DIE (Detect It Easy)
# Website: https://github.com/horsicq/DIE-engine
# Description: Reverse Engineering Engine
# Category: Executables
# Author: Hors (horsicq)
# License: MIT License (https://github.com/horsicq/DIE-engine/blob/master/LICENSE)
# Version: 3.21
# Notes: Detect It Easy - DIE 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '3.21' %}
{% set hash = '078f2934f267392247f9c7b759a1c2457a48bc2000b25b80c2f129955ee4a3b9' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set defender_status = salt['cmd.powershell']('((Get-Service) -match "WinDefend").Name') %}

include:
  - winfor.config.shims

{% if defender_status.lower() == "windefend" %}

die-defender-exclusion:
  cmd.run:
    - names:
      - 'echo "Defender is present on the system."'
      - 'Add-MpPreference -ExclusionPath "{{ inpath }}"'
      - 'Add-MpPreference -ExclusionPath "C:\salt\tempdownload"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var"'
    - shell: powershell
{% else %}

"Defender is not present on the system - no exclusions required for die.":
  test.nop

{% endif %}

die-download:
  file.managed:
    - name: 'C:\salt\tempdownload\die_win64_portable_{{ version }}_x64.zip'
    - source: https://github.com/horsicq/DIE-engine/releases/download/{{ version }}/die_win64_portable_{{ version }}_x64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

die-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\die_win64_portable_{{ version }}_x64.zip'
    - enforce_toplevel: False
    - require:
      - file: die-download

die-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\die\die.exe -OutPath {{ inpath }}\shims\die.exe'
    - require:
      - sls: winfor.config.shims

die-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\DIE.lnk'
    - target: '{{ inpath }}\die\die.exe'
    - force: True
    - working_dir: '{{ inpath }}\die\'
    - makedirs: True
    - require:
      - file: die-download
      - archive: die-extract
