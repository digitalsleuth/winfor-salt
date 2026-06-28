# Name: Wireshark
# Website: https://www.wireshark.org
# Description: Network packet capture and analysis tool
# Category: Network
# Author: The Wireshark Foundation (https://gitlab.com/wireshark/wireshark/-/blob/master/AUTHORS)
# License: GNU General Public License v2 (https://gitlab.com/wireshark/wireshark/-/blob/master/COPYING)
# Version: 4.6.6
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '4.6.6' %}
{% set hash = 'ab28d13695ace992307fb1aaea7144f977d5b6562acec1f465c9c0a9fa04190c' %}

wireshark-download-only:
  file.managed:
    - name: '{{ downloads }}\wireshark\wireshark-{{ version }}.exe'
    - source: https://1.na.dl.wireshark.org/win64/all-versions/Wireshark-{{ version }}-x64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
