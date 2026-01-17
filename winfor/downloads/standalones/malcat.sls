# Name: MalCat
# Website: https://malcat.fr
# Description: Malware Analysis Tool
# Category: Executables
# Author: Malcat EL
# License: https://malcat.fr/index.html#faq6
# Version: 0.9.12
# Notes: 

{% set hash = '0aebc68dcc6b6c6b5f59d4922c81b780cd72cbdd54fa7813cc6a131768a9f2d1' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.9.12' %}

malcat-download-only:
  file.managed:
    - name: '{{ downloads }}\malcat\malcat_win313_lite-{{ version }}.zip'
    - source: https://malcat.fr/latest/malcat_win313_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
