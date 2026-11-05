# Name: Fakenet-NG
# Website: https://github.com/mandiant/flare-fakenet-ng
# Description: Next Generation Dynamic Network Analysis Tool
# Category: Network
# Author: https://github.com/mandiant/flare-fakenet-ng/blob/master/AUTHORS
# License: Apache License 2.0 (https://github.com/mandiant/flare-fakenet-ng/blob/master/LICENSE.txt)
# Version: 3.5
# Notes: 

# renovate: datasource=github-releases depName=mandiant/flare-fakenet-ng
{% set version = '3.5' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'fakenet.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\flare-fakenet-ng\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

{% set defender_status = salt['cmd.powershell']('((Get-Service) -match "WinDefend").Name') %}

{% if defender_status.lower() == "windefend" %}

flare-fakenet-defender-exclusion-offline:
  cmd.run:
    - names:
      - 'echo "Defender is present on the system."'
      - 'Add-MpPreference -ExclusionPath "{{ downloads }}"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var"'
    - shell: powershell
{% else %}

"Defender is not present on the system - no exclusions required for flare-fakenet-ng offline.":
  test.nop

{% endif %}

flare-fakenet-ng-rename-folder-offline:
  file.rename:
    - name: '{{ inpath }}\flare-fakenet-ng'
    - source: '{{ downloads }}\flare-fakenet-ng'
    - makedirs: True

flare-fakenet-ng-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\flare-fakenet-ng\fakenet.exe -OutPath {{ inpath }}\shims\fakenet.exe'
    - require:
      - file: flare-fakenet-ng-rename-folder-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
