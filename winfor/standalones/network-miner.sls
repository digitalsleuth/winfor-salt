# Name: Network Miner
# Website: https://www.netresec.com/
# Description: Network traffic analysis tool
# Category: Network
# Author: NETRESEC AB
# License: GNU General Public License (GPL) v2.0 (https://www.netresec.com/?page=NetworkMinerSourceCode)
# Version: 2.8.1
# Notes: 

{% set version = '2-8-1' %}
{% set hash = '34e8ba09d6bb47463c0e154b7a8eef26922b8dd61000e95d1880aa8c175507e1' %}
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
