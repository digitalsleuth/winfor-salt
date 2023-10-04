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
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

network-miner-download-only:
  file.managed:
    - name: '{{ downloads }}\NetworkMiner_{{ version }}.zip'
    - source: https://www.netresec.com/?download=NetworkMiner
    - source_hash: sha256={{ hash }}
    - makedirs: True
