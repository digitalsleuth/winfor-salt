# Name: InnoExtract
# Website: https://constexpr.org/innoextract
# Description: A tool to unpack installers created by Inno Setup
# Category: Installers
# Author: Daniel Scharrer
# License: https://github.com/dscharrer/innoextract/blob/master/LICENSE
# Version: 1.9
# Notes: 

{% set version = '1.9' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.config.shims

innoextract-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\innoextract'
    - source: '{{ downloads }}\innoextract\innoextract-{{ version }}-windows.zip'
    - enforce_toplevel: False

innoextract-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\innoextract\innoextract.exe -OutPath {{ inpath }}\shims\innoextract.exe'
    - require:
      - sls: winfor.config.shims
