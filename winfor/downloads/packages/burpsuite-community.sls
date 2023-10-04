# Name: Burp Suite Community Edition
# Website: https://portswigger.net
# Description: Packet Intercept and Analysis Tool
# Category: Network
# Author: PortSwigger
# License: https://portswigger.net/burp/tc-community
# Version: v2023.10.1.2
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2023.10.1.2' %}
{% set hash = '080fdd5a3f809f321cf35167b84708fc5fda030084010fff200c5075f5c61540' %}

burpsuite-community-download-only:
  file.managed:
    - name: '{{ downloads }}\Burpsuite-Community-{{ version }}-x64.exe'
    - source: https://portswigger-cdn.net/burp/releases/download?product=community&version={{ version }}&type=WindowsX64
    - source_hash: sha256={{ hash }}
    - makedirs: True
