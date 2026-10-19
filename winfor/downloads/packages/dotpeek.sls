# Name: dotPeek
# Website: https://www.jetbrains.com
# Description: .NET Decompiler and Assembly Browser
# Category: Executables
# Author: JetBrains
# License: EULA (https://www.jetbrains.com/legal/docs/toolbox/license_personal/)
# Version: 2026.1.2
# Notes: 

{% set version = '2026.1.2' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('dotpeek') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

dotpeek-download-only:
  file.managed:
    - name: '{{ downloads }}\dotpeek\dotpeek-{{ version }}.exe'
    - source: https://download.jetbrains.com/resharper/dotUltimate.{{ version }}/dotPeek64.{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
