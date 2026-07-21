# Name: WSL Setup
# Website: https://microsoft.com
# Description: Windows Subsystem for Linux setup
# Category: Terminals
# Author: Microsoft
# License: EULA
# Version: 0.0
# Notes: 

WSL is not yet available for download:
  test.nop

{#
{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set SID = salt['user.info'](user).uid %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = salt['cp.get_file_str']("C:\ProgramData\Salt Project\Salt\srv\salt\winfor\VERSION") %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set defender_status = salt['cmd.powershell']('((Get-Service) -match "WinDefend").Name') %}

include:
  - winfor.config.user
  - winfor.wsl

{% if defender_status.lower() == "windefend" %}
wsl-defender-exclusion:
  cmd.run:
    - names:
      - 'echo "Defender is present on this system."'
      - 'Add-MpPreference -ExclusionPath "{{ inpath }}"'
      - 'Add-MpPreference -ExclusionPath "C:\salt\tempdownload"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var"'
    - shell: powershell

{% else %}

"Defender is not present on this system - no exclusions are required to download WSL for WIN-FOR.":
  test.nop

{% endif %}

#}
