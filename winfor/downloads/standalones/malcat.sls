# Name: MalCat
# Website: https://malcat.fr
# Description: Malware Analysis Tool
# Category: Executables
# Author: Malcat EL
# License: https://malcat.fr/index.html#faq6
# Version: 0.9.11
# Notes: 

{% set hash = 'a89d2bad8179171c00fe00f05e30f023cdf1f9cce8ce2607a3a1d98b1d832c48' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.9.11' %}

malcat-download-only:
  file.managed:
    - name: '{{ downloads }}\malcat\malcat_win313_lite-{{ version }}.zip'
    - source: https://malcat.fr/latest/malcat_win313_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
