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
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

network-miner-download-only:
  file.managed:
    - name: '{{ downloads }}\networkminer\NetworkMiner_{{ version }}.zip'
    - source: https://download.netresec.com/networkminer/NetworkMiner_{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
