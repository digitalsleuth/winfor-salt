# Name: MalCat
# Website: https://malcat.fr
# Description: Malware Analysis Tool
# Category: Executables
# Author: Malcat EL
# License: https://malcat.fr/index.html#faq6
# Version: 0.9.14
# Notes: 

{% set version = '0.9.14' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '31da366523e877e61814586bab0ff12a81a367728914bbe3dd549ec9e7b945dd' %}

malcat-download-only:
  file.managed:
    - name: '{{ downloads }}\malcat\malcat_win313_lite-{{ version }}.zip'
    - source: https://malcat.fr/latest/malcat_win313_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
