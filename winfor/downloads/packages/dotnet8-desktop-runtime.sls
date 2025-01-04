# Name: .NET 8 Desktop Runtime
# Website: https://microsoft.com
# Description: Windows Runtime component
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 8.0.11.34221
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '8.0.11' %}
{% set hash = '7a418127fb8510cfefc6b9db220168b851ef2748f8252829997b3c61510c830a' %}
{% set guid = '27bcdd70-ce64-4049-ba24-2b14f9267729' %}
{% set dl_hash = 'd4a435e55182ce5424a7204c2cf2b3ea' %}

dotnet8-desktop-runtime-download-only:
  file.managed:
    - name: '{{ downloads }}\dotnet8-desktop-runtime\windowsdesktop-runtime-{{ version }}-win-x64.exe'
    - source: https://download.visualstudio.microsoft.com/download/pr/{{ guid }}/{{ dl_hash }}/windowsdesktop-runtime-{{ version }}-win-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
