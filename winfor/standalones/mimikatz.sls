# Name: Mimikatz
# Website: https://github.com/gentilkiwi/mimikatz
# Description: Windows-based hash extraction tool
# Category: Windows Analysis
# Author: Benjamin Delpy
# License: Creative Commons BY 4.0
# Version: 2.2.0-20220919
# Notes: Detects as a virus in Windows - Exclusion gets added during install

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set version = '2.2.0-20220919' %}

mimikatz-defender-exclusion:
  cmd.run:
    - names:
      - 'Add-MpPreference -ExclusionPath "{{ inpath }}\"'
      - 'Add-MpPreference -ExclusionPath "C:\salt\tempdownload\"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var\"'
    - shell: powershell

mimikatz-download:
  file.managed:
    - name: '{{ inpath }}\mimikatz\mimikatz_trunk.zip'
    - source: https://github.com/gentilkiwi/mimikatz/releases/download/{{ version }}/mimikatz_trunk.zip
    - source_hash: sha256=7accd179e8a6b2fc907e7e8d087c52a7f48084852724b03d25bebcada1acbca5
    - makedirs: True
    - require:
      - cmd: mimikatz-defender-exclusion

mimikatz-extract:
  archive.extracted:
    - name: '{{ inpath }}\mimikatz\'
    - source: '{{ inpath }}\mimikatz\mimikatz_trunk.zip'
    - enforce_toplevel: False
    - require:
      - file: mimikatz-download

standalones-mimikatz-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\mimikatz.lnk'
    - target: {{ inpath }}\mimikatz\x64\mimikatz.exe
    - force: True
    - working_dir: {{ inpath }}\mimikatz\x64\
    - makedirs: True
    - require:
      - archive: mimikatz-extract
