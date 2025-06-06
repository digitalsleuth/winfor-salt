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
{% set hash = '24b0e77466823f76175770f7e56d85c20a13140310cdddb837c8007dd433b9ea' %}

dotnet8-desktop-runtime-download-only:
  file.managed:
    - name: '{{ downloads }}\dotnet8-desktop-runtime\windowsdesktop-runtime-{{ version }}-win-x64.exe'
    - source: https://builds.dotnet.microsoft.com/dotnet/WindowsDesktop/{{ version }}/windowsdesktop-runtime-{{ version }}-win-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
