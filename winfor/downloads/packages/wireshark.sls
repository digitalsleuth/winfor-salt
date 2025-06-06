# Name: Wireshark
# Website: https://www.wireshark.org
# Description: Network packet capture and analysis tool
# Category: Network
# Author: The Wireshark Foundation (https://gitlab.com/wireshark/wireshark/-/blob/master/AUTHORS)
# License: GNU General Public License v2 (https://gitlab.com/wireshark/wireshark/-/blob/master/COPYING)
# Version: 4.4.6
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '4.4.6' %}
{% set hash = 'd1925b045300c34ea8082b7ec0d79aeae31edf01eb9fdd9b69e069ece785ca93' %}

wireshark-download-only:
  file.managed:
    - name: '{{ downloads }}\wireshark\Wireshark-{{ version }}-x64.exe'
    - source: https://1.na.dl.wireshark.org/win64/all-versions/Wireshark-{{ version }}-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
