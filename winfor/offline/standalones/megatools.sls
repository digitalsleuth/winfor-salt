# Name: megatools
# Website: https://megatools.megous.com
# Description: Mega.NZ downloader suite
# Category: Utilities
# Author: https://megatools.megous.com/man/megatools.html#_author
# License: GNU General Public License v2 (https://megous.com/git/megatools/tree/LICENSE)
# Version: 1.11.5
# Notes:

{% set version = '1.11.5' %}
{% set date = '20250706' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.config.shims

megatools-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\megatools\megatools-{{ version }}.{{ date }}-win64.zip'
    - enforce_toplevel: True

megatools-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\megatools'
    - source: '{{ inpath }}\megatools-{{ version }}.{{ date }}-win64\'
    - force: True
    - makedirs: True
    - require:
      - archive: megatools-extract-offline

megatools-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\megatools\megatools.exe -OutPath {{ inpath }}\shims\megatools.exe'
    - require:
      - sls: winfor.config.shims
      - archive: megatools-extract-offline
