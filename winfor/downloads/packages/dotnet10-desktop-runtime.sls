# Name: .NET 10 Desktop Runtime
# Website: https://microsoft.com
# Description: Windows Runtime component
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 10.0.7.50000
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '10.0.7' %}
{% set hash = '752b7c81f6b10cacbe133a18a8af8d2598336e9561e651711eb3b36970299854' %}

dotnet10-desktop-runtime-download-only:
  file.managed:
    - name: '{{ downloads }}\dotnet10-desktop-runtime\windowsdesktop-runtime-{{ version }}-win-x64.exe'
    - source: https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/{{ version }}/windowsdesktop-runtime-{{ version }}-win-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
