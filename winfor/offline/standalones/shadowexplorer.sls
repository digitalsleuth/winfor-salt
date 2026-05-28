# Name: Shadow Explorer
# Website: https://www.shadowexplorer.com
# Description: Windows Volume Shadow Copy viewer
# Category: Windows Analysis
# Author: ShadowExplorer
# License: 
# Version: 0.9.462.0
# Notes: 

{% set version = '0.9.462.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.offline.packages.dotnetfx35

shadow-explorer-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\shadowexplorer\ShadowExplorer-{{ version }}-portable.zip'
    - enforce_toplevel: False

shadow-explorer-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\shadowexplorer'
    - source: '{{ inpath }}\ShadowExplorerPortable-0.9'
    - force: True
    - makedirs: True
    - require:
      - archive: shadow-explorer-extract-offline

shadow-explorer-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ShadowExplorer.lnk'
    - target: '{{ inpath }}\shadowexplorer\ShadowExplorerPortable.exe'
    - icon_location: '{{ inpath }}\shadowexplorer\ShadowExplorerPortable.exe'
    - force: True
    - working_dir: '{{ inpath }}\shadowexplorer\'
    - makedirs: True
    - require:
      - file: shadow-explorer-folder-rename-offline
