# Name: MalCat
# Website: https://malcat.fr
# Description: Malware Analysis Tool
# Category: Executables
# Author: Malcat EL
# License: https://malcat.fr/index.html#faq6
# Version: 0.9.2
# Notes: 

{% set hash = '5752ba3c0695f07e7364eabf83e64794733a17576457ca7bf73cf760adcf4496' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

malcat-download-only:
  file.managed:
    - name: '{{ downloads }}\malcat_win64_lite.zip'
    - source: https://malcat.fr/latest/malcat_win64_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
