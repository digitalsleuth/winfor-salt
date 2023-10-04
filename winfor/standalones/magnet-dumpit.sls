# Name: Magnet DumpIt
# Website: https://www.magnetforensics.com
# Description: Windows Memory Dump tools from Comae / Magnet
# Category: Acquisition and Analysis
# Author: Magnet Forensics
# License: EULA
# Version: 20230117
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '20230117' %}
{% set hash = '4cb72d4153ec955a4625f519123c6b404b5d0f09cd3d5ba953c142df228871a6' %}

magnet-dumpit-download:
  file.managed:
    - name: 'C:\salt\tempdownload\Comae-Toolkit-v{{ version }}.zip'
    - source: https://storage.googleapis.com/prod-releases/comae_toolkit/Comae-Toolkit-v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

magnet-dumpit-extract:
  archive.extracted:
    - name: '{{ inpath }}\magnet\dumpit\'
    - source: 'C:\salt\tempdownload\Comae-Toolkit-v{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: magnet-dumpit-download

