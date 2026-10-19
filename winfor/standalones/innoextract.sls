# Name: InnoExtract
# Website: https://constexpr.org/innoextract
# Description: A tool to unpack installers created by Inno Setup
# Category: Installers
# Author: Daniel Scharrer
# License: https://github.com/dscharrer/innoextract/blob/master/LICENSE
# Version: 1.9
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '1.9' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('innoextract') %}

include:
  - winfor.config.shims

innoextract-download:
  file.managed:
    - name: 'C:\salt\tempdownload\innoextract-{{ version }}-windows.zip'
    - source: https://constexpr.org/innoextract/files/innoextract-{{ version }}-windows.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

innoextract-extract:
  archive.extracted:
    - name: '{{ inpath }}\innoextract'
    - source: 'C:\salt\tempdownload\innoextract-{{ version }}-windows.zip'
    - enforce_toplevel: False
    - require:
      - file: innoextract-download

innoextract-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\innoextract\innoextract.exe -OutPath {{ inpath }}\shims\innoextract.exe'
    - require:
      - sls: winfor.config.shims
