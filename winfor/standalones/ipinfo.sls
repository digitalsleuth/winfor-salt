# Name: IPinfo
# Website: https://ipinfo.io
# Description: Command Line Interface for the IPinfo API
# Category: Network
# Author: https://github.com/orgs/ipinfo/people
# License: Apache License v2.0 (https://github.com/ipinfo/cli/blob/master/LICENSE)
# Version: 3.3.2
# Notes: 

{% set version = '3.3.2' %}
{% set hash = '4dd90321cf023b941f8b53db4554cb83d8437879e890b9ecb2a7ca492b0556d3' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

include:
  - winfor.config.shims

ipinfo-download:
  file.managed:
    - name: 'C:\salt\tempdownload\ipinfo_{{ version }}_windows_amd64.zip'
    - source: https://github.com/ipinfo/cli/releases/download/ipinfo-{{ version }}/ipinfo_{{ version }}_windows_amd64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

ipinfo-extract:
  archive.extracted:
    - name: '{{ inpath }}\ipinfo\'
    - source: 'C:\salt\tempdownload\ipinfo_{{ version }}_windows_amd64.zip'
    - enforce_toplevel: False
    - require:
      - file: ipinfo-download

ipinfo-rename:
  file.rename:
    - name: '{{ inpath }}\ipinfo\ipinfo.exe'
    - source: '{{ inpath }}\ipinfo\ipinfo_{{ version }}_windows_amd64.exe'
    - force: True
    - makedirs: True
    - require:
      - archive: ipinfo-extract

ipinfo-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\ipinfo\ipinfo.exe -OutPath {{ inpath }}\shims\ipinfo.exe'
    - require:
      - sls: winfor.config.shims
