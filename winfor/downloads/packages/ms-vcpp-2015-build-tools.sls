# Name: Microsoft VC++ 2015 Build Tools
# Website: https://microsoft.com
# Description: Microsoft Visual C++ 2015 Build Tools
# Category: Requirements
# Author: Microsoft
# License: 
# Version: 15.9.34601.69
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '15.9.34601.69' %}
{% set hash = '6570215835c8d18da2ec133f4389ff6ecfc87011369f74fc575dea221d721a2c' %}

ms-vcpp-2015-build-tools-download-only:
  file.managed:
    - name: '{{ downloads }}\ms-vcpp\vcpp-2015-buildtools-{{ version }}.exe'
    - source: https://aka.ms/vs/15/release/vs_buildtools.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
