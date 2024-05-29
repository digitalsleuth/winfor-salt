# Name: MalCat
# Website: https://malcat.fr
# Description: Malware Analysis Tool
# Category: Executables
# Author: Malcat EL
# License: https://malcat.fr/index.html#faq6
# Version: 0.9.6
# Notes: 

{% set hash = '1af086168b89f521d7abc3c71b97ceca92aaa6742d38d14d19f9ee932c3aba07' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.9.6' %}

malcat-download-only:
  file.managed:
    - name: '{{ downloads }}\malcat\malcat_win64_lite-{{ version }}.zip'
    - source: https://malcat.fr/latest/malcat_win64_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
