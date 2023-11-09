# Name: MalCat
# Website: https://malcat.fr
# Description: Malware Analysis Tool
# Category: Executables
# Author: Malcat EL
# License: https://malcat.fr/index.html#faq6
# Version: 0.9.4
# Notes: 

{% set hash = '0b8f746dcf71abfea333bf4784d79686627a8a6dc2cd991c96e30ffe65bdebc4' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.9.4' %}

malcat-download-only:
  file.managed:
    - name: '{{ downloads }}\malcat\malcat_win64_lite-{{ version }}.zip'
    - source: https://malcat.fr/latest/malcat_win64_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
