# Name: MalCat
# Website: https://malcat.fr
# Description: Malware Analysis Tool
# Category: Executables
# Author: Malcat EL
# License: https://malcat.fr/index.html#faq6
# Version: 0.9.7
# Notes: 

{% set hash = '3e6c8cf9fd5a76142730b45d40b6c3ed4e284819513f02134ff2bf4c5a209319' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.9.7' %}

malcat-download-only:
  file.managed:
    - name: '{{ downloads }}\malcat\malcat_win64_lite-{{ version }}.zip'
    - source: https://malcat.fr/latest/malcat_win64_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
