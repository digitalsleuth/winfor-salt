# Name: MalCat
# Website: https://malcat.fr
# Description: Malware Analysis Tool
# Category: Executables
# Author: Malcat EL
# License: https://malcat.fr/index.html#faq6
# Version: 0.9.0
# Notes: 

{% set hash = '2096A716EADA02E2C637E9376D465E14E7B4A33733FD7E08B435C6C838EC636D' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

malcat-download-only:
  file.managed:
    - name: '{{ downloads }}\malcat_win64_lite.zip'
    - source: https://malcat.fr/latest/malcat_win64_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
