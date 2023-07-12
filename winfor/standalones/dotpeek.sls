# Name: dotPeek
# Website: https://www.jetbrains.com
# Description: .NET Decompiler and Assembly Browser
# Category: Executables
# Author: JetBrains
# License: EULA (https://www.jetbrains.com/legal/docs/toolbox/license_personal/)
# Version: 2023.1.3
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '2023.1.3' %}
{% set hash = '06f44b387f87e3e1f5982234c1c4d71957e230fa9d30ae204eb5ad5b65d17a6a' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

dotpeek-download:
  file.managed:
    - name: '{{ inpath }}\dotpeek\dotPeek64.exe'
    - source: https://download.jetbrains.com/resharper/dotUltimate.{{ version }}/dotPeek64.{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

dotpeek-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\dotpeek\'
    - require:
      - file: dotpeek-download

standalones-dotpeek-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\dotPeek64.lnk'
    - target: '{{ inpath }}\dotpeek\dotPeek64.exe'
    - force: True
    - working_dir: '{{ inpath }}\dotpeek\'
    - makedirs: True
    - require:
      - file: dotpeek-download
