# Name: UnAutoIt
# Website: https://github.com/digitalsleuth/UnAutoIt
# Description: AutoIt extractor
# Category: Installers
# Author: Corey Forman (digitalsleuth) / x0r19x91
# License: GNU General Public License v3 (https://github.com/digitalsleuth/UnAutoIt/blob/main/LICENSE)
# Version: 1.1.1
# Notes: 

{% set version = '1.1.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('unautoit') %}

include:
  - winfor.config.shims

unautoit-download:
  file.managed:
    - name: '{{ inpath }}\unautoit\unautoit.exe'
    - source: https://github.com/digitalsleuth/UnAutoIt/releases/download/v{{ version }}/UnAutoIt-windows-amd64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

unautoit-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\unautoit\unautoit.exe -OutPath {{ inpath }}\shims\unautoit.exe'
    - require:
      - sls: winfor.config.shims
