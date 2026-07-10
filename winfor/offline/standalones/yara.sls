# Name: YARA
# Website: https://virustotal.github.io/yara
# Description: Pattern Matching analysis tool
# Category: Utilities
# Author: VirusTotal (https://github.com/VirusTotal/yara/blob/master/AUTHORS)
# License: BSD 3-Clause (https://github.com/VirusTotal/yara/blob/master/COPYING)
# Version: 4.5.5
# Notes: 

{% set version = '4.5.5' %}
{% set subversion = '2368' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'yara-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\yara\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

yara-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\yara\'
    - source: '{{ downloads }}\yara\{{ pkg }}'
    - enforce_toplevel: False

yara-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\yara\yara64.exe -OutPath {{ inpath }}\shims\yara.exe'
    - require:
      - sls: winfor.config.shims

yarac-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\yara\yarac64.exe -OutPath {{ inpath }}\shims\yarac.exe'
    - require:
      - sls: winfor.config.shims

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}