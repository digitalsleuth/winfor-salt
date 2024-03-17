# Name: OSFMount
# Website: https://www.osforensics.com/tools/mount-disk-images.html
# Description: Drive / Disk / Image mounting tool
# Category: Acquisition and Analysis
# Author: PassMark
# License: Free (EULA, contained in software)
# Version: 3.1.1003.0
# Notes: 

{% set hash = '9fe0738b7c2d29a7414e67f53aea359f3801d1c37b44f1b4fed5d02cb7536369' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.1.1003.0' %}

osfmount-download-only:
  file.managed:
    - name: '{{ downloads }}\osfmount\osfmount-{{ version }}.exe'
    - source: https://www.osforensics.com/downloads/osfmount.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
