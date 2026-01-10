# Name: scdbg
# Website: http://sandsprite.com/blogs/index.php?uid=7&pid=152
# Description: Shellcode analysis tool
# Category: Executables
# Author: David Zimmer
# License: 
# Version: Jul 10 2023 14:21:55
# Notes: 

{% set hash = '9298580a436db7d07eec71314bf3ff9e6dd638acf50900051fa0fe11fd3cf147' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2023-07-10' %}

scdbg-download-only:
  file.managed:
    - name: '{{ downloads }}\scdbg\scdbg-{{ version }}.zip'
    - source: https://sandsprite.com/CodeStuff/scdbg.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
