# Name: MobaXterm
# Website: https://mobaxterm.mobatek.net
# Description: Enhanced Terminal for Windows
# Category: Terminals
# Author: Mobatek (https://www.mobatek.net/aboutus.html)
# License: https://mobaxterm.mobatek.net/license.html
# Version: 23.0
# Notes: Home Edition

{% set version = '23.0' %}
{% set source_folder = '2302023012231703' %}
{% set hash = '668550319b08dbc690290b13d129d337b3d82383b7def31afaecff4e793b5c1d' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

mobaxterm-download-only:
  file.managed:
    - name: '{{ downloads }}\MobaXterm_Installer_v{{ version }}.zip'
    - source: "https://download.mobatek.net/{{ source_folder }}/MobaXterm_Installer_v{{ version }}.zip"
    - source_hash: sha256={{ hash }}
    - makedirs: True
