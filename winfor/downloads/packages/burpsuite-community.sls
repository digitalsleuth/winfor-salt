# Name: Burp Suite Community Edition
# Website: https://portswigger.net
# Description: Packet Intercept and Analysis Tool
# Category: Network
# Author: PortSwigger
# License: https://portswigger.net/burp/tc-community
# Version: v2022.11.2
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2022.11.2' %}
{% set hash = '7ab4387b226b63241a7eef35db8491d5b413d84462819ec5e69af80045a736b4' %}

burpsuite-community-download-only:
  file.managed:
    - name: '{{ downloads }}\Burpsuite-Community-{{ version }}-x64.exe'
    - source: https://portswigger-cdn.net/burp/releases/download?product=community&version={{ version }}&type=WindowsX64
    - source_hash: sha256={{ hash }}
    - makedirs: True
