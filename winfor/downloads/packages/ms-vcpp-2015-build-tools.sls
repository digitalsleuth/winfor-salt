# Name: Microsoft VC++ 2015 Build Tools
# Website: https://microsoft.com
# Description: Microsoft Visual C++ 2015 Build Tools
# Category: Requirements
# Author: Microsoft
# License: 
# Version: 15.9.34118.181
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '15.9.34118.181' %}
{% set hash = '137b8591f2c772d0fe53225015eab5f2e75d0d51cf9c384a0ab5162e2aecaf59' %}

ms-vcpp-2015-build-tools-download-only:
  file.managed:
    - name: '{{ downloads }}\vcpp-2015-buildtools.exe'
    - source: https://aka.ms/vs/15/release/vs_buildtools.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
