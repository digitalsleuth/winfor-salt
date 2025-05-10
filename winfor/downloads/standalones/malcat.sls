# Name: MalCat
# Website: https://malcat.fr
# Description: Malware Analysis Tool
# Category: Executables
# Author: Malcat EL
# License: https://malcat.fr/index.html#faq6
# Version: 0.9.10
# Notes: 

{% set hash = '22b790fbc358e7b20952009e6a2ae09dbea17d55bbe75b590d8f2aa01ffac538' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.9.10' %}

malcat-download-only:
  file.managed:
    - name: '{{ downloads }}\malcat\malcat_win313_lite-{{ version }}.zip'
    - source: https://malcat.fr/latest/malcat_win313_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
