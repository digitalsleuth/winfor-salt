# Name: Network Miner
# Website: https://www.netresec.com/
# Description: Network traffic analysis tool
# Category: Network
# Author: NETRESEC AB
# License: GNU General Public License (GPL) v2.0 (https://www.netresec.com/?page=NetworkMinerSourceCode)
# Version: 3.1
# Notes: 

{% set version = '3.1' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'networkminer-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\networkminer\\' + pkg) %}

{% if exists %}

network-miner-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\networkminer\{{ pkg }}'
    - enforce_toplevel: True
    - overwrite: True

network-miner-rename-offline:
  file.rename:
    - name: '{{ inpath }}\network-miner'
    - source: '{{ inpath }}\NetworkMiner_{{ version | replace(".","_") }}'
    - force: True
    - makedirs: True
    - require:
      - archive: network-miner-extract-offline

network-miner-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\NetworkMiner.lnk'
    - target: '{{ inpath }}\network-miner\NetworkMiner.exe'
    - force: True
    - working_dir: '{{ inpath }}\network-miner\'
    - makedirs: True
    - require:
      - archive: network-miner-extract-offline
      - file: network-miner-rename-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
