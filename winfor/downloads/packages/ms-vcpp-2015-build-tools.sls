# Name: Microsoft VC++ 2015 Build Tools
# Website: https://microsoft.com
# Description: Microsoft Visual C++ 2015 Build Tools
# Category: Requirements
# Author: Microsoft
# License: 
# Version: 15.9.51
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '15.9.51' %}
{% set hash = '618876e85bac28e6b631bd18a283cc78f3d688622c77a58390f1d6458a2b470d' %}

ms-vcpp-2015-build-tools-download-only:
  file.managed:
    - name: '{{ downloads }}\vcpp-2015-buildtools.exe'
    - source: https://aka.ms/vs/15/release/vs_buildtools.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
