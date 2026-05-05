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
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.config.shims

unautoit-copy-offline:
  file.copy:
    - name: '{{ inpath }}\unautoit\unautoit.exe'
    - source: '{{ downloads }}\unautoit\unautoit-{{ version }}.exe'
    - makedirs: True
    - force: True

unautoit-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\unautoit\unautoit.exe -OutPath {{ inpath }}\shims\unautoit.exe'
    - require:
      - sls: winfor.config.shims
