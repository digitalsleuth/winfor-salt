# Name: MalCat
# Website: https://malcat.fr
# Description: Malware Analysis Tool
# Category: Executables
# Author: Malcat EL
# License: https://malcat.fr/index.html#faq6
# Version: 0.9.15
# Notes: 

{% set version = '0.9.15' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set hash = 'bfd198d6d4ad24a2b555bffbe77d21b7bd69577fef7919dce6221b8896fc8a76' %}

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
