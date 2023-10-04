# Name: Wireshark
# Website: https://www.wireshark.org
# Description: Network packet capture and analysis tool
# Category: Network
# Author: The Wireshark Foundation (https://gitlab.com/wireshark/wireshark/-/blob/master/AUTHORS)
# License: GNU General Public License v2 (https://gitlab.com/wireshark/wireshark/-/blob/master/COPYING)
# Version: 4.0.8
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '4.0.8' %}
{% set hash = '8243e019d2bd73c81de53c67ddb23d877ecec2fc1699c9aa074ccaa2d7d9b267' %}

wireshark-download-only:
  file.managed:
    - name: '{{ downloads }}\Wireshark-win64-{{ version }}.exe'
    - source: https://1.na.dl.wireshark.org/win64/all-versions/Wireshark-win64-{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
