# Name: Microsoft VC++ 2015 Build Tools
# Website: https://microsoft.com
# Description: Microsoft Visual C++ 2015 Build Tools
# Category: Requirements
# Author: Microsoft
# License: 
# Version: 15.9.36101.55
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '15.9.36101.55' %}
{% set hash = '2d67b51649f2f576aee4ae349df6ffa31acdb2643138d589b5e3cdbad949306d' %}

ms-vcpp-2015-build-tools-download-only:
  file.managed:
    - name: '{{ downloads }}\ms-vcpp\vcpp-2015-buildtools-{{ version }}.exe'
    - source: https://aka.ms/vs/15/release/vs_buildtools.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
