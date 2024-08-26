# Name: MobaXterm
# Website: https://mobaxterm.mobatek.net
# Description: Enhanced Terminal for Windows
# Category: Terminals
# Author: Mobatek (https://www.mobatek.net/aboutus.html)
# License: https://mobaxterm.mobatek.net/license.html
# Version: 23.6
# Notes: Home Edition

{% set version = '23.6' %}
{% set source_folder = '2362023122033030' %}
{% set hash = '6770bb1538143f530441e9de17583d99e5cb529ae54340f84de1f313f4081927' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

mobaxterm-download-only:
  file.managed:
    - name: '{{ downloads }}\mobaxterm\MobaXterm_Installer_v{{ version }}.zip'
    - source: "https://download.mobatek.net/{{ source_folder }}/MobaXterm_Installer_v{{ version }}.zip"
    - source_hash: sha256={{ hash }}
    - makedirs: True
