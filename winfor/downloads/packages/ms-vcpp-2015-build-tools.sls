# Name: Microsoft VC++ 2015 Build Tools
# Website: https://microsoft.com
# Description: Microsoft Visual C++ 2015 Build Tools
# Category: Requirements
# Author: Microsoft
# License: 
# Version: 15.9.36631.12
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '15.9.36631.12' %}
{% set hash = 'ca11782db44225d313c9887b4254dfa57c5b72fef025bf620c81c43dff73c6ed' %}

ms-vcpp-2015-build-tools-download-only:
  file.managed:
    - name: '{{ downloads }}\ms-vcpp\vcpp-2015-buildtools-{{ version }}.exe'
    - source: https://aka.ms/vs/15/release/vs_buildtools.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
