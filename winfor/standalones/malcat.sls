# Name: MalCat
# Website: https://malcat.fr
# Description: Malware Analysis Tool
# Category: Executables
# Author: Malcat EL
# License: https://malcat.fr/index.html#faq6
# Version: 0.9.10
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set hash = '22b790fbc358e7b20952009e6a2ae09dbea17d55bbe75b590d8f2aa01ffac538' %}

malcat-download:
  file.managed:
    - name: 'C:\salt\tempdownload\malcat_win313_lite.zip'
    - source: https://malcat.fr/latest/malcat_win313_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

malcat-extract:
  archive.extracted:
    - name: '{{ inpath }}\malcat'
    - source: 'C:\salt\tempdownload\malcat_win313_lite.zip'
    - enforce_toplevel: False
    - require:
      - file: malcat-download

malcat-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\MalCat.lnk'
    - target: '{{ inpath }}\malcat\bin\malcat.exe'
    - force: True
    - working_dir: '{{ inpath }}\malcat\bin\'
    - makedirs: True
    - require:
      - file: malcat-download
      - archive: malcat-extract
