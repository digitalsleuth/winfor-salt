# Name: Brim
# Website: https://www.brimdata.io/
# Description: Network Forensic GUI Tool using Zeek and Suricata
# Category: Network
# Author: Brim Data
# License: GNU General Public License (GPL) (https://github.com/brimdata/brim/blob/main/LICENSE.txt)
# Version: 0.31.0
# Notes:

{% set version = '0.31.0' %}
{% set hash = '49E8B1AD9CA1ACEE832CCB01816277A21271CB9F50B8EBD477C6200A405F5C9B' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

brim-download-only:
  file.managed:
    - name: '{{ downloads }}\Brim-Setup-{{ version }}.exe'
    - source: https://github.com/brimdata/brim/releases/download/v{{ version }}/Brim-Setup-{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
