# Name: MalCat
# Website: https://malcat.fr
# Description: Malware Analysis Tool
# Category: Malware
# Author: 
# License: 
# Version:
# Notes: 

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set hash = '03cff6c2003f0cc6ea93b36dac2869aa54d41d6eb16ffdca9b1a14fff22c2609' %}

malcat-download:
  file.managed:
    - name: 'C:\salt\tempdownload\malcat_win64_lite.zip'
    - source: https://malcat.fr/latest/malcat_win64_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

malcat-extract:
  archive.extracted:
    - name: 'C:\standalone\malcat'
    - source: 'C:\salt\tempdownload\malcat_win64_lite.zip'
    - enforce_toplevel: False
    - require:
      - file: malcat-download

malcat-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\MalCat.lnk'
    - target: 'C:\standalone\malcat\bin\malcat.exe'
    - force: True
    - working_dir: 'C:\standalone\malcat\bin\'
    - makedirs: True
    - require:
      - file: malcat-download
      - archive: malcat-extract
