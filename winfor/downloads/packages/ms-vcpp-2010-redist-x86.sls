# Name: Microsoft VC++ 2010 Redistributable
# Website: https://microsoft.com
# Description: Microsoft Visual C++ 2010 Redistributable
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 10.0.40219
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '10.0.40219' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('ms-vcpp-2010-redist-x86') %}

ms-vcpp-2010-redist-x86-download-only:
  file.managed:
    - name: '{{ downloads }}\ms-vcpp\ms-vcpp-2010-redist-x86-{{ version }}.exe'
    - source: https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
