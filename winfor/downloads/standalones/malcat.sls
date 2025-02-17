# Name: MalCat
# Website: https://malcat.fr
# Description: Malware Analysis Tool
# Category: Executables
# Author: Malcat EL
# License: https://malcat.fr/index.html#faq6
# Version: 0.9.9
# Notes: 

{% set hash = 'd44d6a08336aac5917ad2dca979586f023dfa674fc043ca5dd15e91633a0285e' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.9.9' %}

malcat-download-only:
  file.managed:
    - name: '{{ downloads }}\malcat\malcat_win313_lite-{{ version }}.zip'
    - source: https://malcat.fr/latest/malcat_win313_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
