# Name: InnoExtract
# Website: https://constexpr.org/innoextract
# Description: A tool to unpack installers created by Inno Setup
# Category: Installers
# Author: Daniel Scharrer
# License: https://github.com/dscharrer/innoextract/blob/master/LICENSE
# Version: 1.9
# Notes: 

{% set version = '1.9' %}
{% set hash = '6989342c9b026a00a72a38f23b62a8e6a22cc5de69805cf47d68ac2fec993065' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

innoextract-download-only:
  file.managed:
    - name: '{{ downloads }}\innoextract\innoextract-{{ version }}-windows.zip'
    - source: https://constexpr.org/innoextract/files/innoextract-{{ version }}-windows.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
