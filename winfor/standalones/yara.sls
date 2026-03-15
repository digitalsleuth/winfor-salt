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
{% set hash = '352396c8a3d9b31b157a4820abd3b9347fc934a2314cdda8a4f566a5570163e4' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

include:
  - winfor.config.shims

yara-download:
  file.managed:
    - name: 'C:\salt\tempdownload\yara-{{ version }}-{{ subversion }}-win64.zip'
    - source: https://github.com/VirusTotal/yara/releases/download/v{{ version }}/yara-{{ version }}-{{ subversion }}-win64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

yara-extract:
  archive.extracted:
    - name: '{{ inpath }}\yara\'
    - source: 'C:\salt\tempdownload\yara-{{ version }}-{{ subversion }}-win64.zip'
    - enforce_toplevel: False
    - require:
      - file: yara-download

yara-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\yara\yara64.exe -OutPath {{ inpath }}\shims\yara.exe'
    - require:
      - sls: winfor.config.shims

yarac-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\yara\yarac64.exe -OutPath {{ inpath }}\shims\yarac.exe'
    - require:
      - sls: winfor.config.shims
