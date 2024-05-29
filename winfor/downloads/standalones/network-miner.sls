# Name: Network Miner
# Website: https://www.netresec.com/
# Description: Network traffic analysis tool
# Category: Network
# Author: NETRESEC AB
# License: GNU General Public License (GPL) v2.0 (https://www.netresec.com/?page=NetworkMinerSourceCode)
# Version: 2.9
# Notes: 

{% set version = '2-9' %}
{% set hash = 'c610f6ba647ddd9c718e87018ee40595a4d72a52a6b3b7ceb53caf4fa8de6f05' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

network-miner-download-only:
  file.managed:
    - name: '{{ downloads }}\networkminer\NetworkMiner_{{ version }}.zip'
    - source: https://download.netresec.com/networkminer/NetworkMiner_{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
