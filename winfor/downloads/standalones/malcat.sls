# Name: MalCat
# Website: https://malcat.fr
# Description: Malware Analysis Tool
# Category: Executables
# Author: Malcat EL
# License: https://malcat.fr/index.html#faq6
# Version: 0.9.8
# Notes: 

{% set hash = '892044b0a8564df26b0bd01631232f1e7e739a30411b06f9e8769f284e0b40b2' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '0.9.8' %}

malcat-download-only:
  file.managed:
    - name: '{{ downloads }}\malcat\malcat_win64_lite-{{ version }}.zip'
    - source: https://malcat.fr/latest/malcat_win64_lite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
