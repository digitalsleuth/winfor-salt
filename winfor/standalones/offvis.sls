# Name: OffVis
# Website: http://go.microsoft.com/fwlink/?LinkId=158791
# Description: Office document visualization tool
# Category: Documents / Editors
# Author: Microsoft
# License: EULA
# Version: 1.1.0.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.dotnetfx35

offvis-download:
  file.managed:
    - name: 'C:\salt\tempdownload\OffVis.zip'
    - source: https://go.microsoft.com/fwlink/?LinkId=158791
    - source_hash: sha256=8432c2e81ab51bf46fc9a1b17629f4ff7c3902f976132477428b84918be08351
    - makedirs: True
    - require:
      - sls: winfor.packages.dotnetfx35

offvis-extract:
  archive.extracted:
    - name: '{{ inpath }}\OffVis'
    - source: 'C:\salt\tempdownload\OffVis.zip'
    - enforce_toplevel: False
    - require:
      - file: offvis-download

standalones-offvis-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\OffVis.lnk'
    - target: '{{ inpath }}\OffVis\OffVis.exe'
    - force: True
    - working_dir: '{{ inpath }}\OffVis'
    - makedirs: True
    - require:
      - file: offvis-download
      - archive: offvis-extract
