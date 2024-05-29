# Name: Burp Suite Community Edition
# Website: https://portswigger.net
# Description: Packet Intercept and Analysis Tool
# Category: Network
# Author: PortSwigger
# License: https://portswigger.net/burp/tc-community
# Version: v2024.4.4
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2024.4.4' %}
{% set hash = '9a0e0bc60efe212cd3587d18d1baac37be097d42397ee1c74a7cebe8565db6e6' %}

burpsuite-community-download-only:
  file.managed:
    - name: '{{ downloads }}\burpsuite\Burpsuite-Community-{{ version }}-x64.exe'
    - source: https://portswigger-cdn.net/burp/releases/download?product=community&version={{ version }}&type=WindowsX64
    - source_hash: sha256={{ hash }}
    - makedirs: True
