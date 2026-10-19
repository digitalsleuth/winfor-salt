# Name: InnoExtract
# Website: https://constexpr.org/innoextract
# Description: A tool to unpack installers created by Inno Setup
# Category: Installers
# Author: Daniel Scharrer
# License: https://github.com/dscharrer/innoextract/blob/master/LICENSE
# Version: 1.9
# Notes: 

{% set version = '1.9' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('innoextract') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

innoextract-download-only:
  file.managed:
    - name: '{{ downloads }}\innoextract\innoextract-{{ version }}.zip'
    - source: https://constexpr.org/innoextract/files/innoextract-{{ version }}-windows.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
