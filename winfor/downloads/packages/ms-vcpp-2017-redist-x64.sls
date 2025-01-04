# Name: Microsoft VC++ 2017+ Redistributable
# Website: https://microsoft.com
# Description: Microsoft Visual C++ 2017+ Redistributable
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 14.42.34433
# Notes:

{% set version = '14.42.34433' %}
{% set subpath = 'c7dac50a-e3e8-40f6-bbb2-9cc4e3dfcabe/1821577409C35B2B9505AC833E246376CC68A8262972100444010B57226F0940' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '1821577409c35b2b9505ac833e246376cc68a8262972100444010b57226f0940' %}

ms-vcpp-2017-redist-x64-download-only:
  file.managed:
    - name: '{{ downloads }}\ms-vcpp-2017-redist-x64\VC_redist.{{ version }}.x64.exe'
    - source: https://download.visualstudio.microsoft.com/download/pr/{{ subpath }}/VC_redist.x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
