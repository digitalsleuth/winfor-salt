# Name: dotPeek
# Website: https://www.jetbrains.com
# Description: .NET Decompiler and Assembly Browser
# Category: Executables
# Author: JetBrains
# License: EULA (https://www.jetbrains.com/legal/docs/toolbox/license_personal/)
# Version: 2025.1.2
# Notes: 

{% set version = '2025.1.2' %}
{% set hash = 'b0bca127b8b9db181d76dee5d8021f62a10b0bc3569b5f6ecc4ed9fddb07b19e' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

dotpeek-download-only:
  file.managed:
    - name: '{{ downloads }}\dotpeek\dotPeek64-{{ version }}.exe'
    - source: https://download.jetbrains.com/resharper/dotUltimate.{{ version }}/JetBrains.dotPeek.{{ version }}.web.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
