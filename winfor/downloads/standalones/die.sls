# Name: DIE (Detect It Easy)
# Website: https://github.com/horsicq/DIE-engine
# Description: Reverse Engineering Engine
# Category: Executables
# Author: Hors (horsicq)
# License: MIT License (https://github.com/horsicq/DIE-engine/blob/master/LICENSE)
# Version: 3.21
# Notes: Detect It Easy - DIE 

{% set version = '3.21' %}
{% set hash = '078f2934f267392247f9c7b759a1c2457a48bc2000b25b80c2f129955ee4a3b9' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set defender_status = salt['cmd.powershell']('((Get-Service) -match "WinDefend").Name') %}

{% if defender_status.lower() == "windefend" %}

die-defender-exclusion-download-only:
  cmd.run:
    - names:
      - 'echo "Defender is present on the system."'
      - 'Add-MpPreference -ExclusionPath "{{ inpath }}"'
      - 'Add-MpPreference -ExclusionPath "C:\salt\tempdownload"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var"'
    - shell: powershell
{% else %}

"Defender is not present on the system - no exclusions required to download die.":
  test.nop

{% endif %}

die-download-only:
  file.managed:
    - name: '{{ downloads }}\die\die_win64_portable_{{ version }}_x64.zip'
    - source: https://github.com/horsicq/DIE-engine/releases/download/{{ version }}/die_win64_portable_{{ version }}_x64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
