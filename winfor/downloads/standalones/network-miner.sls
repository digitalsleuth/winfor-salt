# Name: Network Miner
# Website: https://www.netresec.com/
# Description: Network traffic analysis tool
# Category: Network
# Author: NETRESEC AB
# License: GNU General Public License (GPL) v2.0 (https://www.netresec.com/?page=NetworkMinerSourceCode)
# Version: 3.2
# Notes: 

{% set version = '3.2' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('network-miner') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

network-miner-download-only:
  file.managed:
    - name: '{{ downloads }}\networkminer\networkminer-{{ version }}.zip'
    - source: https://download.netresec.com/networkminer/NetworkMiner_{{ version | replace('.','-') }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
