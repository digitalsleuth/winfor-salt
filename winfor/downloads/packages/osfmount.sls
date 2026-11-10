# Name: OSFMount
# Website: https://www.osforensics.com/tools/mount-disk-images.html
# Description: Drive / Disk / Image mounting tool
# Category: Acquisition and Analysis
# Author: PassMark
# License: Free (EULA, contained in software)
# Version: 3.3.1000.0
# Notes: 

{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('osfmount') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.3.1000.0' %}

osfmount-download-only:
  file.managed:
    - name: '{{ downloads }}\osfmount\osfmount-{{ version }}.exe'
    - source: https://www.osforensics.com/downloads/osfmount.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
