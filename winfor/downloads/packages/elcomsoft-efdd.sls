# Name: Elcomsoft Forensic Disk Decryptor
# Website: https://www.elcomsoft.com/
# Description: Tool for decrypting disks or extracting encryption keys from memory
# Category: Acquisition and Analysis
# Author: Elcomsoft
# License: EULA (https://www.elcomsoft.com/legal.html)
# Version: 2.21.1024.8145
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.21.1024.8145' %}
{% set hash = 'f6dcaa7c94be5346524d532003a535305eb70eea5ca16cc4e98333dc292a4e3c' %}

elcomsoft-efdd-download-only:
  file.managed:
    - name: '{{ downloads }}\elcomsoft-efdd\efdd_setup_en-{{ version }}.msi'
    - source: https://www.elcomsoft.com/download/efdd_setup_en.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
