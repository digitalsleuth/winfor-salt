# Name: MobaXterm
# Website: https://mobaxterm.mobatek.net
# Description: Enhanced Terminal for Windows
# Category: Terminals
# Author: Mobatek (https://www.mobatek.net/aboutus.html)
# License: https://mobaxterm.mobatek.net/license.html
# Version: 23.3
# Notes: Home Edition

{% set version = '23.3' %}
{% set source_folder = '2332023092000531' %}
{% set hash = '4021ce8311fe88afeabcc677981294a79d4c8c744c583cfcc6c75453cfae05cc' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

mobaxterm-download-only:
  file.managed:
    - name: '{{ downloads }}\mobaxterm\MobaXterm_Installer_v{{ version }}.zip'
    - source: "https://download.mobatek.net/{{ source_folder }}/MobaXterm_Installer_v{{ version }}.zip"
    - source_hash: sha256={{ hash }}
    - makedirs: True
