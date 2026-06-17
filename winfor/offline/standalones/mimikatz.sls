# Name: Mimikatz
# Website: https://github.com/gentilkiwi/mimikatz
# Description: Windows-based hash extraction tool
# Category: Windows Analysis
# Author: Benjamin Delpy
# License: Creative Commons BY 4.0
# Version: 2.2.0-20220919
# Notes: Detects as a virus in Windows - Exclusion gets added during install

{% set version = '2.2.0-20220919' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set defender_status = salt['cmd.powershell']('((Get-Service) -match "WinDefend").Name') %}

include:
  - winfor.config.shims

{% if defender_status.lower() == "windefend" %}

mimikatz-defender-exclusion-offline:
  cmd.run:
    - names:
      - 'Add-MpPreference -ExclusionPath "{{ inpath }}\"'
    - shell: powershell

{% else %}

"Defender is not present on the system - no exclusions required for mimikatz in offline mode.":
  test.nop

{% endif %}

mimikatz-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\mimikatz\'
    - source: '{{ downloads }}\mimikatz\mimikatz-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - cmd: mimikatz-defender-exclusion-offline

mimikatz-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\mimikatz.lnk'
    - target: {{ inpath }}\mimikatz\x64\mimikatz.exe
    - force: True
    - working_dir: {{ inpath }}\mimikatz\x64\
    - makedirs: True
    - require:
      - archive: mimikatz-extract-offline

mimikatz-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\mimikatz\x64\mimikatz.exe -OutPath {{ inpath }}\shims\mimikatz.exe'
    - require:
      - sls: winfor.config.shims
      - archive: mimikatz-extract-offline
