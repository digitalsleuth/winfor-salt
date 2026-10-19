# Name: nuget
# Website: https://www.nuget.org/
# Description: PowerShell Package Manager
# Category: Requirements
# Author: Microsoft
# License: Apache v2.0 (https://github.com/NuGet/NuGet.Client/blob/dev/LICENSE.txt)
# Version: 6.14.0 is for standalone binary only.
# Notes:

{% set version = '6.14.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('nuget') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

nuget-download-only:
  file.managed:
    - name: '{{ downloads }}\nuget\nuget-{{ version }}.exe'
    - source: https://dist.nuget.org/win-x86-commandline/v{{ version }}/nuget.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
