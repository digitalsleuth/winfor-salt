# Name: Network Miner
# Website: https://www.netresec.com/
# Description: Network traffic analysis tool
# Category: Network
# Author: NETRESEC AB
# License: GNU General Public License (GPL) v2.0 (https://www.netresec.com/?page=NetworkMinerSourceCode)
# Version: 3.2
# Notes: 

{% set version = '3-2' %}
{% set hash = 'daceec649fb4fe59b11e4a9e4ecd5f51c1dd37824280dfbeac67bec27b6b6d60' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

network-miner-download:
  file.managed:
    - name: 'C:\salt\tempdownload\NetworkMiner_{{ version }}.zip'
    - source: https://www.netresec.com/?download=NetworkMiner
    - source_hash: sha256={{ hash }}
    - makedirs: True

network-miner-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\NetworkMiner_{{ version }}.zip'
    - enforce_toplevel: True
    - overwrite: True
    - require:
      - file: network-miner-download

network-miner-rename:
  file.rename:
    - name: '{{ inpath }}\network-miner'
    - source: '{{ inpath }}\NetworkMiner_{{ version }}'
    - force: True
    - makedirs: True
    - require:
      - archive: network-miner-extract

network-miner-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\NetworkMiner.lnk'
    - target: '{{ inpath }}\network-miner\NetworkMiner.exe'
    - force: True
    - working_dir: '{{ inpath }}\network-miner\'
    - makedirs: True
    - require:
      - archive: network-miner-extract
      - file: network-miner-rename
