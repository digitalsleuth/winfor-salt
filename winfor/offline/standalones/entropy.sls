# Name: Entropy
# Website: https://github.com/merces/entropy
# Description: Command-line tool to calculate entropy of a file
# Category: Utilities
# Author: Fernando Merces
# License: GNU General Public License v2.0 (https://github.com/merces/entropy/blob/master/LICENSE)
# Version: 1.1
# Notes: 

{% set version = '1.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'entropy-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\entropy\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

entropy-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\entropy\{{ pkg }}'
    - enforce_toplevel: False

entropy-version-file-offline:
  file.managed:
    - name: '{{ inpath }}\entropy\Version.txt'
    - contents:
      - '1.1'
    - require:
      - archive: entropy-extract-offline

entropy-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\entropy\entropy.exe -OutPath {{ inpath }}\shims\entropy.exe'
    - require:
      - sls: winfor.config.shims

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}