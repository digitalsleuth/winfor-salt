# Name: Network Miner
# Website: https://www.netresec.com/
# Description: Network traffic analysis tool
# Category: Network
# Author: NETRESEC AB
# License: GNU General Public License (GPL) v2.0 (https://www.netresec.com/?page=NetworkMinerSourceCode)
# Version: 3.2
# Notes: 

{% set version = '3.2' %}
{% set hash = 'daceec649fb4fe59b11e4a9e4ecd5f51c1dd37824280dfbeac67bec27b6b6d60' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

network-miner-download-only:
  file.managed:
    - name: '{{ downloads }}\networkminer\networkminer-{{ version }}.zip'
    - source: https://download.netresec.com/networkminer/NetworkMiner_3-2.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
