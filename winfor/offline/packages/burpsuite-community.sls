# Name: Burp Suite Community Edition
# Website: https://portswigger.net
# Description: Packet Intercept and Analysis Tool
# Category: Network
# Author: PortSwigger
# License: https://portswigger.net/burp/tc-community
# Version: v2024.4.4
# Notes:

{% set version = '2024.4.4' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'burpsuite-community-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\burpsuite\\' + pkg) %}

{% if exists %}
burpsuite-install-offline:
  cmd.run:
    - name: '{{ pkg }} -q'
    - shell: cmd
    - cwd: '{{ downloads }}\burpsuite\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
