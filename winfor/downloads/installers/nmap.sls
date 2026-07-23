# Name: nmap
# Website: https://nmap.org
# Description: Network Mapping utility
# Category: Network
# Author: Gordon Lyon
# License: Nmap Public Source License Version 0.95 (https://github.com/nmap/nmap/blob/master/LICENSE)
# Version: 7.99
# Notes: nmap and npcap have no silent install

{% set nmap_version = '7.99' %}
{% set npcap_version = '1.88' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set nmap_hash = 'fda839f35d9f8f18a11670e17d0332ce9d05a3556c5a20e91b0b56c57774f611' %}
{% set npcap_hash = 'a2f4ec1e5ea353ff67efd24b2ebf081ba44532410fae8d5e146af0310aa4f56b' %}

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
