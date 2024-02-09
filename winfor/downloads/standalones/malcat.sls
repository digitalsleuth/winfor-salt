# Name: MalCat
# Website: https://malcat.fr
# Description: Malware Analysis Tool
# Category: Executables
# Author: Malcat EL
# License: https://malcat.fr/index.html#faq6
# Version: 0.9.5
# Notes: 

{% set hash = '9b4a6eea4d5b6052e3fba6da1ef4b22d2ca892779ea562b9777e34afe72ab06d' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.9.5' %}

malcat-download-only:
  file.managed:
    - name: '{{ downloads }}\malcat\malcat_win64_lite-{{ version }}.zip'
    - source: https://malcat.fr/latest/malcat_win64_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
