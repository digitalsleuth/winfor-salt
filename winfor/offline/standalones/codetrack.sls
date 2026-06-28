# Name: Codetrack
# Website: https://www.getcodetrack.com
# Description: .NET Performance Profiler
# Category: Executables
# Author: Nico Van Goethem
# License: Freeware (see the About section in the application)
# Version: 1.0.3.3
# Notes: No longer maintained

{% set version = '1.0.3.3' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

codetrack-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\codetrack\'
    - source: '{{ downloads }}\codetrack\codetrack_{{ version | replace(".", "_") }}.zip'
    - enforce_toplevel: False

codetrack-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Codetrack.lnk'
    - target: {{ inpath }}\codetrack\CodeTrack.exe
    - force: True
    - working_dir: {{ inpath }}\codetrack\
    - makedirs: True
    - require:
      - archive: codetrack-extract-offline
