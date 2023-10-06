# Name: Wireshark
# Website: https://www.wireshark.org
# Description: Network packet capture and analysis tool
# Category: Network
# Author: The Wireshark Foundation (https://gitlab.com/wireshark/wireshark/-/blob/master/AUTHORS)
# License: GNU General Public License v2 (https://gitlab.com/wireshark/wireshark/-/blob/master/COPYING)
# Version: 4.0.10
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '4.0.10' %}
{% set hash = '085D9AA4F6614730F132FB5C28EC5FA445DEA79687E4C648D586DE569FFCC5E2' %}

wireshark-download-only:
  file.managed:
    - name: '{{ downloads }}\Wireshark-win64-{{ version }}.exe'
    - source: https://1.na.dl.wireshark.org/win64/all-versions/Wireshark-win64-{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
