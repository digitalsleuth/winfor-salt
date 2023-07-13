# Name: MalCat
# Website: https://malcat.fr
# Description: Malware Analysis Tool
# Category: Executables
# Author: Malcat EL
# License: https://malcat.fr/index.html#faq6
# Version: 0.9.2
# Notes: 

{% set hash = 'aac4b02e6ec50ea77f6fb9149e87f1dd607300af47c261681ba0c5e5a1c99c53' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

malcat-download-only:
  file.managed:
    - name: '{{ downloads }}\malcat_win64_lite.zip'
    - source: https://malcat.fr/latest/malcat_win64_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
