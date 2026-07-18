# Name: MalCat
# Website: https://malcat.fr
# Description: Malware Analysis Tool
# Category: Executables
# Author: Malcat EL
# License: https://malcat.fr/index.html#faq6
# Version: 0.9.15
# Notes: 

{% set version = '0.9.15' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'bfd198d6d4ad24a2b555bffbe77d21b7bd69577fef7919dce6221b8896fc8a76' %}

malcat-download-only:
  file.managed:
    - name: '{{ downloads }}\malcat\malcat-{{ version }}.zip'
    - source: https://malcat.fr/latest/malcat_win313_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
