# Name: Codetrack
# Website: https://www.getcodetrack.com
# Description: .NET Performance Profiler
# Category: Executables
# Author: Nico Van Goethem
# License: Freeware (see the About section in the application)
# Version: 1.0.3.3
# Notes: No longer maintained

{% set version = '1.0.3.3' %}
{% set hash = '455eccfcc568004bf6108ba9ad8dbbc32cdecb84c6c62153c8f181ca984d68ce' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

codetrack-download:
  file.managed:
    - name: 'C:\salt\tempdownload\codetrack_1_0_3_3.zip'
    - source: https://www.getcodetrack.com/releases/codetrack_1_0_3_3.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

codetrack-extract:
  archive.extracted:
    - name: '{{ inpath }}\codetrack\'
    - source: 'C:\salt\tempdownload\codetrack_1_0_3_3.zip'
    - enforce_toplevel: False
    - require:
      - file: codetrack-download

codetrack-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Codetrack.lnk'
    - target: {{ inpath }}\codetrack\CodeTrack.exe
    - force: True
    - working_dir: {{ inpath }}\codetrack\
    - makedirs: True
    - require:
      - archive: codetrack-extract
