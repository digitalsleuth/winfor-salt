# Name: Zui
# Website: https://www.brimdata.io/
# Description: Network Forensic GUI Tool using Zeek, Suricata and Zed
# Category: Network
# Author: Brim Data
# License: GNU General Public License (GPL) (https://github.com/brimdata/zui/blob/main/apps/zui/LICENSE.txt)
# Version: 1.3.0
# Notes:

{% set version = '1.3.0' %}
{% set hash = '38bb9077def7aca1ecb5c0fab00e96dc0c41543b6e6d6541295687f2bcaac1a0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

zui-download-only:
  file.managed:
    - name: '{{ downloads }}\Zui-Setup-{{ version }}.exe'
    - source: https://github.com/brimdata/zui/releases/download/v{{ version }}/Zui-Setup-{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
