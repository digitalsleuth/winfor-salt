# Name: dotPeek
# Website: https://www.jetbrains.com
# Description: .NET Decompiler and Assembly Browser
# Category: Executables
# Author: JetBrains
# License: EULA (https://www.jetbrains.com/legal/docs/toolbox/license_personal/)
# Version: 2023.2.2
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '2023.2.2' %}
{% set hash = '8dcfd2cc5df83b5fc54bcc4ab8b844d773e62035362d42e9b1952477a82222f4' %}
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
