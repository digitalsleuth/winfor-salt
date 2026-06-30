# Name: MobaXterm
# Website: https://mobaxterm.mobatek.net
# Description: Enhanced Terminal for Windows
# Category: Terminals
# Author: Mobatek (https://www.mobatek.net/aboutus.html)
# License: https://mobaxterm.mobatek.net/license.html
# Version: 26.3
# Notes: Home Edition

{% set version = '26.3' %}
{% set source_folder = '2632026040882303' %}
{% set hash = '9fa4381dae047c1bc6bca3a50ff8a3bc63eb7a38fdb2137854f0548bf967e754' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

mobaxterm-download-only:
  file.managed:
    - name: '{{ downloads }}\mobaxterm\mobaxterm-{{ version }}.zip'
    - source: "https://download.mobatek.net/{{ source_folder }}/MobaXterm_Installer_v{{ version }}.zip"
    - source_hash: sha256={{ hash }}
    - makedirs: True
