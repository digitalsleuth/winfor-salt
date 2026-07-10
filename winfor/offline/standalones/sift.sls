# Name: sift
# Website: https://sift-tool.org/
# Description: A fast and powerful alternative to grep
# Category: Raw Parsers / Decoders
# Author: Sven Taute
# License: GNU General Public License v3.0 (https://github.com/svent/sift/blob/master/LICENSE)
# Version: 0.9.2
# Notes: 

{% set version = '0.9.2' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'sift-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\sift\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

sift-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\sift'
    - source: '{{ downloads }}\sift\sift-{{ version }}.zip'
    - enforce_toplevel: False

sift-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\sift\sift.exe -OutPath {{ inpath }}\shims\sift.exe'
    - require:
      - sls: winfor.config.shims
      - archive: sift-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}

