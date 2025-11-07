# Name: MobaXterm
# Website: https://mobaxterm.mobatek.net
# Description: Enhanced Terminal for Windows
# Category: Terminals
# Author: Mobatek (https://www.mobatek.net/aboutus.html)
# License: https://mobaxterm.mobatek.net/license.html
# Version: 25.3
# Notes: Home Edition

{% set version = '25.3' %}
{% set source_folder = '2532025092512146' %}
{% set hash = '17efd554dff3a01e991a891ab7ae66c135a5a3438e1a790bf8e44096c47b220f' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

mobaxterm-download-only:
  file.managed:
    - name: '{{ downloads }}\mobaxterm\MobaXterm_Installer_v{{ version }}.zip'
    - source: "https://download.mobatek.net/{{ source_folder }}/MobaXterm_Installer_v{{ version }}.zip"
    - source_hash: sha256={{ hash }}
    - makedirs: True
