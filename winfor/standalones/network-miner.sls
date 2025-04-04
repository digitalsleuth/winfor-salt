# Name: Network Miner
# Website: https://www.netresec.com/
# Description: Network traffic analysis tool
# Category: Network
# Author: NETRESEC AB
# License: GNU General Public License (GPL) v2.0 (https://www.netresec.com/?page=NetworkMinerSourceCode)
# Version: 3.0
# Notes: 

{% set version = '3-0' %}
{% set hash = '5d074a54e2f2f26d0a2cf5a2833ab08345f1a0eeba2bdf746835545ec23e3032' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

network-miner-download:
  file.managed:
    - name: 'C:\salt\tempdownload\NetworkMiner_{{ version }}.zip'
    - source: https://download.netresec.com/networkminer/NetworkMiner_{{ version }}.zip
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
