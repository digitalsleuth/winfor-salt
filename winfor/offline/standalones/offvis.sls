# Name: OffVis
# Website: http://go.microsoft.com/fwlink/?LinkId=158791
# Description: Office document visualization tool
# Category: Documents / Editors
# Author: Microsoft
# License: EULA
# Version: 1.1.0.0
# Notes: 

{% set version = '1.1.0.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.offline.packages.dotnetfx35

offvis-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\OffVis'
    - source: '{{ downloads }}\offvis\OffVis-{{ version }}.zip'
    - enforce_toplevel: False

offvis-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\OffVis.lnk'
    - target: '{{ inpath }}\OffVis\OffVis.exe'
    - force: True
    - working_dir: '{{ inpath }}\OffVis'
    - makedirs: True
    - require:
      - archive: offvis-extract-offline
      - sls: winfor.offline.packages.dotnetfx35
