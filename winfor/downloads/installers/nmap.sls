# Name: nmap
# Website: https://nmap.org
# Description: Network Mapping utility
# Category: Network
# Author: Gordon Lyon
# License: Nmap Public Source License Version 0.95 (https://github.com/nmap/nmap/blob/master/LICENSE)
# Version: 7.99
# Notes: nmap and npcap have no silent install

{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set nmap_version = get_hash('nmap', 'nmap_version') %}
{% set npcap_version = get_hash('nmap', 'npcap_version') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set nmap_hash = get_hash('nmap', 'nmap_hash') %}
{% set npcap_hash = get_hash('nmap', 'npcap_hash') %}

nmap-download-only:
  file.managed:
    - name: '{{ downloads }}\nmap\nmap-{{ nmap_version }}.exe'
    - source: https://nmap.org/dist/nmap-{{ nmap_version }}-setup.exe
    - source_hash: sha256={{ nmap_hash }}
    - makedirs: True

npcap-download-only:
  file.managed:
    - name: '{{ downloads }}\nmap\npcap-{{ npcap_version }}.exe'
    - source: https://npcap.com/dist/npcap-{{ npcap_version }}.exe
    - source_hash: sha256={{ npcap_hash }}
    - makedirs: True
