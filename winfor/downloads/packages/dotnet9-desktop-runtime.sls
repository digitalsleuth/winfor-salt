# Name: .NET 8 Desktop Runtime
# Website: https://microsoft.com
# Description: Windows Runtime component
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 9.0.5.34816
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '9.0.5' %}
{% set hash = 'a9620b3bf29c8ef2b4c18051589bd24e0c2437eaec4e677f54d67fdd0f3a38bc' %}

dotnet9-desktop-runtime-download-only:
  file.managed:
    - name: '{{ downloads }}\dotnet9-desktop-runtime\windowsdesktop-runtime-{{ version }}-win-x64.exe'
    - source: https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/{{ version }}/windowsdesktop-runtime-{{ version }}-win-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
