# Name: MalCat
# Website: https://malcat.fr
# Description: Malware Analysis Tool
# Category: Executables
# Author: Malcat EL
# License: https://malcat.fr/index.html#faq6
# Version: 0.9.3
# Notes: 

{% set hash = 'bfae447af0d189cdd84094583fbab0873e00775dd828e01219fc0bdfbca1c1e7' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

malcat-download-only:
  file.managed:
    - name: '{{ downloads }}\malcat_win64_lite.zip'
    - source: https://malcat.fr/latest/malcat_win64_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
