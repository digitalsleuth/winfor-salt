# Name: Elcomsoft Forensic Disk Decryptor
# Website: https://www.elcomsoft.com/
# Description: Tool for decrypting disks or extracting encryption keys from memory
# Category: Acquisition and Analysis
# Author: Elcomsoft
# License: EULA (https://www.elcomsoft.com/legal.html)
# Version: 2.20.1011.6893
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.20.1011.6893' %}
{% set hash = '675ca40709c5b8b64ef19ac43db306d919203423fe1e63033226c0706bc05c7b' %}

elcomsoft-efdd-download-only:
  file.managed:
    - name: '{{ downloads }}\efdd_setup_en.msi'
    - source: https://www.elcomsoft.com/download/efdd_setup_en.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
