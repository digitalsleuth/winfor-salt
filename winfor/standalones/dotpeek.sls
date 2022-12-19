# Name: dotPeek
# Website: https://www.jetbrains.com
# Description: .NET Decompiler and Assembly Browser
# Category: Executables
# Author: JetBrains
# License: EULA (https://www.jetbrains.com/legal/docs/toolbox/license_personal/)
# Version: 2022.2.4
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '2022.2.4' %}
{% set hash = 'f720038e7366791c310a86b92cae778a1b177ceb5dcd4b8c50792a7405d53ff8' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

dotpeek-download:
  file.managed:
    - name: '{{ inpath }}\dotpeek\dotPeek64.exe'
    - source: https://download.jetbrains.com/resharper/dotUltimate.{{ version }}/JetBrains.dotPeek.{{ version }}.web.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

dotpeek-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\dotpeek\'
    - require:
      - file: dotpeek-download

winfor-standalones-dotpeek-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\dotPeek64.lnk'
    - target: '{{ inpath }}\dotpeek\dotPeek64.exe'
    - force: True
    - working_dir: '{{ inpath }}\dotpeek\'
    - makedirs: True
    - require:
      - file: dotpeek-download
