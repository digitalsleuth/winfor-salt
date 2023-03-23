# Name: Network Miner
# Website: https://www.netresec.com/
# Description: Network traffic analysis tool
# Category: Network
# Author: NETRESEC AB
# License: GNU General Public License (GPL) v2.0 (https://www.netresec.com/?page=NetworkMinerSourceCode)
# Version: 2.8
# Notes: 

{% set version = '2-8' %}
{% set hash = '13DC519E24A44485554BE6E3651BF9381B9EA13A0376CDF958508C75E3B1BB7A' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

network-miner-download-only:
  file.managed:
    - name: '{{ downloads }}\NetworkMiner_{{ version }}.zip'
    - source: https://www.netresec.com/?download=NetworkMiner
    - source_hash: sha256={{ hash }}
    - makedirs: True
