# Name: dotPeek
# Website: https://www.jetbrains.com
# Description: .NET Decompiler and Assembly Browser
# Category: Executables
# Author: JetBrains
# License: EULA (https://www.jetbrains.com/legal/docs/toolbox/license_personal/)
# Version: 2023.1.3
# Notes: 

{% set version = '2023.1.3' %}
{% set hash = '06f44b387f87e3e1f5982234c1c4d71957e230fa9d30ae204eb5ad5b65d17a6a' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

dotpeek-download-only:
  file.managed:
    - name: '{{ downloads }}\dotpeek\dotPeek64.exe'
    - source: https://download.jetbrains.com/resharper/dotUltimate.{{ version }}/dotPeek64.{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
