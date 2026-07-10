# Name: Network Miner
# Website: https://www.netresec.com/
# Description: Network traffic analysis tool
# Category: Network
# Author: NETRESEC AB
# License: GNU General Public License (GPL) v2.0 (https://www.netresec.com/?page=NetworkMinerSourceCode)
# Version: 3.1
# Notes: 

{% set version = '3.1' %}
{% set hash = '782e3d4d0b917a5aadf59966ab7d21ab30dbd593eff14e426f2b580a2e3f89e1' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

network-miner-download-only:
  file.managed:
    - name: '{{ downloads }}\networkminer\networkminer-{{ version }}.zip'
    - source: https://www.netresec.com/?download=NetworkMiner
    - source_hash: sha256={{ hash }}
    - makedirs: True
