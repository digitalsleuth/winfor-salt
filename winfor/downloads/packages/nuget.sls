# Name: nuget
# Website: https://www.nuget.org/
# Description: PowerShell Package Manager
# Category: Requirements
# Author: Microsoft
# License: Apache v2.0 (https://github.com/NuGet/NuGet.Client/blob/dev/LICENSE.txt)
# Version: 6.9.1 is for standalone binary only.
# Notes:

{% set version = '6.9.1' %}
{% set hash = '82bb13e2365e1e5ee7d0975618dcf90b279427de8a7ecb338b9b78bfc457d51b' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

nuget-download-only:
  file.managed:
    - name: '{{ downloads }}\nuget\nuget-{{ version }}.exe'
    - source: https://dist.nuget.org/win-x86-commandline/v{{ version }}/nuget.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
