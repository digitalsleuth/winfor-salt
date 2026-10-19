# Name: .NET 8 Desktop Runtime
# Website: https://microsoft.com
# Description: Windows Runtime component
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 8.0.16.34817
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '8.0.16' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('dotnet8-desktop-runtime') %}

dotnet8-desktop-runtime-download-only:
  file.managed:
    - name: '{{ downloads }}\dotnet8-desktop-runtime\dotnet8-desktop-runtime-{{ version }}.exe'
    - source: https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/{{ version }}/windowsdesktop-runtime-{{ version }}-win-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
