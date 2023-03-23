# Name: dotPeek
# Website: https://www.jetbrains.com
# Description: .NET Decompiler and Assembly Browser
# Category: Executables
# Author: JetBrains
# License: EULA (https://www.jetbrains.com/legal/docs/toolbox/license_personal/)
# Version: 2022.2.4
# Notes: 

{% set version = '2022.2.4' %}
{% set hash = 'f720038e7366791c310a86b92cae778a1b177ceb5dcd4b8c50792a7405d53ff8' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

dotpeek-download-only:
  file.managed:
    - name: '{{ downloads }}\dotpeek\dotPeek64.exe'
    - source: https://download.jetbrains.com/resharper/dotUltimate.{{ version }}/JetBrains.dotPeek.{{ version }}.web.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
