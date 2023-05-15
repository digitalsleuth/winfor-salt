# Name: MalCat
# Website: https://malcat.fr
# Description: Malware Analysis Tool
# Category: Executables
# Author: Malcat EL
# License: https://malcat.fr/index.html#faq6
# Version: 0.9.1
# Notes: 

{% set hash = '3edf6223b2d8cb8feca8606c9081b1dfecb49dba2238a41a49833827422f53d6' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

malcat-download-only:
  file.managed:
    - name: '{{ downloads }}\malcat_win64_lite.zip'
    - source: https://malcat.fr/latest/malcat_win64_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
