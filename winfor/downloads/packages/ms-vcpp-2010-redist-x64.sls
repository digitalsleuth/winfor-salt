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
{% set hash = 'f3b7a76d84d23f91957aa18456a14b4e90609e4ce8194c5653384ed38dada6f3' %}

ms-vcpp-2010-redist-x64-download-only:
  file.managed:
    - name: '{{ downloads }}\vcpp-2010-redist-x64.exe'
    - source: https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
