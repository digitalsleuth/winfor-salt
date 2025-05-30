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
{% set hash = '0d20debb26fc8b2bc84f25fbd9d4596a6364af8517ebf012e8b871127b798941' %}
{% set guid = 'f6b6c5dc-e02d-4738-9559-296e938dabcb' %}
{% set dl_hash = 'b66d365729359df8e8ea131197715076' %}

dotnet6-desktop-runtime-download-only:
  file.managed:
    - name: '{{ downloads }}\dotnet6-desktop-runtime\windowsdesktop-runtime-{{ version }}-win-x64.exe'
    - source: https://download.visualstudio.microsoft.com/download/pr/{{ guid }}/{{ dl_hash }}/windowsdesktop-runtime-{{ version }}-win-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
