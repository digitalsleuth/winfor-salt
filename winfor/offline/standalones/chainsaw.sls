# Name: Chainsaw
# Website: https://github.com/WithSecureLabs/Chainsaw
# Description: Event Log and Windows Artefact Parser
# Category: Logs
# Author: WithSecureLabs / Countercept
# License: GNU General Public License v3.0 (https://github.com/WithSecureLabs/chainsaw/blob/master/LICENCE)
# Version: 2.14.1
# Notes:

{% set version = '2.14.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set defender_status = salt['cmd.powershell']('((Get-Service) -match "WinDefend").Name') %}

include:
  - winfor.config.shims

{% if defender_status.lower() == "windefend" %}

chainsaw-defender-exclusion-offline:
  cmd.run:
    - names:
      - 'echo "Defender is present on the system."'
      - 'Add-MpPreference -ExclusionPath "{{ inpath }}"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var"'
    - shell: powershell
{% else %}

"Defender is not present on the system - no exclusions required for Chainsaw in offline install":
  test.nop

{% endif %}

chainsaw-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\chainsaw\chainsaw-{{ version }}.zip'
    - enforce_toplevel: False
    - overwrite: True
    - if_missing: '{{ inpath }}\chainsaw'

chainsaw-rename-offline:
  file.rename:
    - name: '{{ inpath }}\chainsaw\chainsaw.exe'
    - source: '{{ inpath }}\chainsaw\chainsaw_x86_64-pc-windows-msvc.exe'
    - force: True
    - require:
      - archive: chainsaw-extract-offline

chainsaw-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\chainsaw\chainsaw.exe -OutPath {{ inpath }}\shims\chainsaw.exe'
    - require:
      - sls: winfor.config.shims
