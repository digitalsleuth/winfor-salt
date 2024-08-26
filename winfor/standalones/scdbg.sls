# Name: scdbg
# Website: http://sandsprite.com/blogs/index.php?uid=7&pid=152
# Description: Shellcode analysis tool
# Category: Executables
# Author: David Zimmer
# License: 
# Version: Jul 10 2023 14:21:55
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = '9298580a436db7d07eec71314bf3ff9e6dd638acf50900051fa0fe11fd3cf147' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

scdbg-download:
  file.managed:
    - name: 'C:\salt\tempdownload\scdbg.zip'
    - source: http://sandsprite.com/CodeStuff/scdbg.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

scdbg-extract:
  archive.extracted:
    - name: '{{ inpath }}\scdbg\'
    - source: 'C:\salt\tempdownload\scdbg.zip'
    - enforce_toplevel: False
    - require:
      - file: scdbg-download

scdbg-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\scdbg\'
    - require:
      - archive: scdbg-extract

standalones-scdbg-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\SCDBG-GUI.lnk'
    - target: '{{ inpath }}\scdbg\gui_launcher.exe'
    - force: True
    - working_dir: '{{ inpath }}\scdbg\'
    - makedirs: True
    - require:
      - file: scdbg-download
      - archive: scdbg-extract
