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
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('burpsuite-community') %}

burpsuite-community-download-only:
  file.managed:
    - name: '{{ downloads }}\burpsuite\burpsuite-community-{{ version }}.exe'
    - source: https://portswigger-cdn.net/burp/releases/download?product=community&version={{ version }}&type=WindowsX64
    - source_hash: sha256={{ hash }}
    - makedirs: True
