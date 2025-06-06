# Name: Zui
# Website: https://www.brimdata.io/
# Description: Network Forensic GUI Tool using Zeek, Suricata and Zed
# Category: Network
# Author: Brim Data
# License: GNU General Public License (GPL) (https://github.com/brimdata/zui/blob/main/apps/zui/LICENSE.txt)
# Version: 1.18.0
# Notes:

{% set version = '1.18.0' %}
{% set hash = '4150273579dbe40c77c873b3269d733a13023e34868231b0e44c54a3925b8a4c' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

zui-download-only:
  file.managed:
    - name: '{{ downloads }}\zui\Zui-Setup-{{ version }}.exe'
    - source: https://github.com/brimdata/zui/releases/download/v{{ version }}/Zui-Setup-{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
