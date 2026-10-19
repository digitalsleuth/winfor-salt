# Name: Zui
# Website: https://www.brimdata.io/
# Description: Network Forensic GUI Tool using Zeek, Suricata and Zed
# Category: Network
# Author: Brim Data
# License: GNU General Public License (GPL) (https://github.com/brimdata/zui/blob/main/apps/zui/LICENSE.txt)
# Version: 1.18.0
# Notes:

{% set version = '1.18.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('zui') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

zui-download-only:
  file.managed:
    - name: '{{ downloads }}\zui\zui-{{ version }}.exe'
    - source: https://github.com/brimdata/zui/releases/download/v{{ version }}/Zui-Setup-{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
