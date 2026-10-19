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
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set exists = salt['file.directory_exists'](downloads + '\\nmap') %}

{% if exists %}

nmap-offline:
  file.copy:
    - name: '{{ inpath }}\nmap'
    - source: '{{ downloads }}\nmap\'
    - skip_verify: True
    - makedirs: True
    - force: True

{% else %}

nmap-folder-does-not-exist:
  module.run:
    - name: log.warning
    - message: "Nmap folder does not exist"

{# Nmap folder does not exist:
  test.nop #}

{% endif %}
