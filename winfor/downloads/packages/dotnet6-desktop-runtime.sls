# Name: .NET 6 Desktop Runtime
# Website: https://microsoft.com
# Description: Windows Runtime component
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 6.0.7.31422
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '6.0.7.31422' %}
{% set hash = 'd669f26726fd40649f21613b6289c29f6329fd9242f8e4af4f979cc8f4f92739' %}

dotnet6-desktop-runtime-download-only:
  file.managed:
    - name: '{{ downloads }}\dotnet6-desktop-runtime\windowsdesktop-runtime-6.0.7-win-x64.exe'
    - source: https://download.visualstudio.microsoft.com/download/pr/dc0e0e83-0115-4518-8b6a-590ed594f38a/65b63e41f6a80decb37fa3c5af79a53d/windowsdesktop-runtime-6.0.7-win-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
