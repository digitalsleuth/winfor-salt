# Name: .NET 6 Desktop Runtime
# Website: https://microsoft.com
# Description: Windows Runtime component
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 6.0.36.34217
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '6.0.36' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('dotnet6-desktop-runtime') %}
{% set guid = get_hash('dotnet6-desktop-runtime', 'guid') %}
{% set dl_hash = get_hash('dotnet6-desktop-runtime', 'dl_hash') %}

dotnet6-desktop-runtime-download-only:
  file.managed:
    - name: '{{ downloads }}\dotnet6-desktop-runtime\dotnet6-desktop-runtime-{{ version }}.exe'
    - source: https://download.visualstudio.microsoft.com/download/pr/{{ guid }}/{{ dl_hash }}/windowsdesktop-runtime-{{ version }}-win-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
