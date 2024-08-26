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
{% set hash = '6989342c9b026a00a72a38f23b62a8e6a22cc5de69805cf47d68ac2fec993065' %}

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

innoextract-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\innoextract\'
