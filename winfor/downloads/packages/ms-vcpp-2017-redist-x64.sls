# Name: Microsoft VC++ 2017+ Redistributable
# Website: https://microsoft.com
# Description: Microsoft Visual C++ 2017+ Redistributable
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 14.44.35208.0
# Notes:

{% set version = '14.44.35208.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set subpath = get_hash('ms-vcpp-2017-redist-x64', 'subpath') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = get_hash('ms-vcpp-2017-redist-x64') %}

ms-vcpp-2017-redist-x64-download-only:
  file.managed:
    - name: '{{ downloads }}\ms-vcpp\ms-vcpp-2017-redist-{{ version }}.exe'
    - source: https://download.visualstudio.microsoft.com/download/pr/{{ subpath }}/VC_redist.x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
