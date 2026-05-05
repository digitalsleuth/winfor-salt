# Name: IPinfo
# Website: https://ipinfo.io
# Description: Command Line Interface for the IPinfo API
# Category: Network
# Author: https://github.com/orgs/ipinfo/people
# License: Apache License v2.0 (https://github.com/ipinfo/cli/blob/master/LICENSE)
# Version: 3.3.1
# Notes: 

{% set version = '3.3.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.config.shims

ipinfo-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\ipinfo\'
    - source: '{{ downloads }}\ipinfo\ipinfo_{{ version }}_windows_amd64.zip'
    - enforce_toplevel: False

ipinfo-rename-offline:
  file.rename:
    - name: '{{ inpath }}\ipinfo\ipinfo.exe'
    - source: '{{ inpath }}\ipinfo\ipinfo_{{ version }}_windows_amd64.exe'
    - force: True
    - makedirs: True
    - require:
      - archive: ipinfo-extract-offline

ipinfo-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\ipinfo\ipinfo.exe -OutPath {{ inpath }}\shims\ipinfo.exe'
    - require:
      - sls: winfor.config.shims
