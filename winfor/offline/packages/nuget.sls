# Name: nuget
# Website: https://www.nuget.org/
# Description: PowerShell Package Manager
# Category: Requirements
# Author: Microsoft
# License: Apache v2.0 (https://github.com/NuGet/NuGet.Client/blob/dev/LICENSE.txt)
# Version: 6.14.0 is for standalone binary only.
# Notes:

{% set version = '6.14.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'nuget-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\nuget\\' + pkg) %}

{% if exists %}
include:
  - winfor.config.shims

nuget-move-offline:
  file.rename:
    - name: '{{ inpath }}\nuget'
    - source: '{{ downloads }}\nuget\'
    - force: True
    - makedirs: True

nuget-rename-offline:
  file.rename:
    - name: '{{ inpath }}\nuget\nuget.exe'
    - source: '{{ inpath }}\nuget\nuget-{{ version }}.exe'
    - force: True
    - makedirs: True

nuget-install-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe "{{ inpath }}\nuget\nuget.exe" -OutPath {{ inpath }}\shims\nuget.exe'
    - require:
      - sls: winfor.config.shims
      - file: nuget-move-offline
      - file: nuget-rename-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
